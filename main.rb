require 'kramdown'

$global_binding = binding

class EvalDoc < Kramdown::Document
  attr_accessor :context

  def initialize(text, *opts)
    super(text, *opts)
    self.context = $global_binding
  end

  def eval_code
    self.root = scan_el(self.root)
    self
  end

  def scan_el(el)
    new_children = []
    el.children.each do |child_el|
      child_el = scan_el(child_el)
      new_children << child_el

      is_code = child_el.type == :codeblock || child_el.type == :codespan

      if is_code && child_el.options[:lang] == 'ruby'
        code = child_el.value.gsub(/^ *ruby *\n/, '')
        new_children << eval_and_elementize(code)
      end
    end

    el.children = new_children

    return el
  end

  def eval_and_elementize(code)
    eval_result = self.context.eval(code)

    case
    when eval_result.respond_to?(:to_html)
      Kramdown::Document.new(eval_result.to_html, input: :html).root
    when eval_result.respond_to?(:to_s)
      blockquote_el(eval_result.to_s)
    else
      blockquote_el(eval_result.inspect)
    end
  end

  private
  def blockquote_el(text)
    text_el = Kramdown::Element.new(:text, text)
    p_el = Kramdown::Element.new(:p)
    p_el.children << text_el
    block_quote_el = Kramdown::Element.new(:blockquote)
    block_quote_el.children << p_el
    block_quote_el
  end
end

doc = EvalDoc.new(STDIN.read)

doc.eval_code

puts <<-HTML
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href='https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/2.10.0/github-markdown.min.css' rel='stylesheet' type='text/css' />
    <style>
      article.markdown-body {
        box-sizing: border-box;
        min-width: 200px;
        max-width: 980px;
        margin: 0 auto;
        padding: 45px;
      }

      span.line-numbers {
        display: none;
      }
    </style>
  </head>
  <body>
    <article class='markdown-body'>
      #{doc.to_html}
    </article>
  </body>
</html>
HTML