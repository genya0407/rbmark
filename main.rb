require 'kramdown'
require 'erb'
require 'stringio'

def get_context
  binding
end

class EvalDoc < Kramdown::Document
  attr_accessor :context, :stdout

  def initialize(text, *opts)
    super(text, *opts)

    self.context = get_context
    self.root = scan_el(self.root)
  end

  private
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
    stdout = StringIO.new

    $stdout = stdout
    eval_result = self.context.eval(code)
    $stdout = STDOUT

    stdout_string = stdout.string.empty? ? '' : stdout.string + "\n"

    case
    when eval_result.respond_to?(:to_html)
      Kramdown::Document.new(eval_result.to_html, input: :html).root
    else
      text_result_el(stdout_string + "=> #{eval_result}")
    end
  end

  def text_result_el(text)
    text_el = Kramdown::Element.new(:codeblock, text)
    p_el = Kramdown::Element.new(:p)
    p_el.children << text_el
    p_el
  end
end

def main # bindingを隔離するため
  doc = EvalDoc.new(STDIN.read) # ERBの中で使っている

  puts ERB.new(File.read('./template.html.erb')).result(binding)
end

main
