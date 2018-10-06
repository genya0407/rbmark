# Data science

## Numo::Narray

~~~ruby
require 'numo/narray'

class Numo::NArray
  def to_html
    rows = self.to_a.map do |row|
      elems = row.map do |elem|
        "<td>#{elem}</td>"
      end
      "<tr>#{elems}</tr>"
    end
    "<table>#{rows.join}</table>"
  end
end
~~~

~~~ruby
a = Numo::DFloat.new(3, 5).seq
~~~

## Numo::Gnuplot

~~~ruby
require 'numo/gnuplot'
require 'base64'
require 'tempfile'

class RbMarkPlot < Numo::Gnuplot
  def plot(*args)
    super(*args)
    self
  end

  def splot(*args)
    super(*args)
    self
  end

  def _plot_splot(*args)
    @tempfile = Tempfile.open(['plot', '.png'])
    set terminal: 'png'
    set output: @tempfile.path
    super(*args)
  end

  def to_html
    img_b64 = Base64.encode64(File.read(@tempfile))
    <<-HTML
      <img src='data:image/png;base64,#{img_b64}' />
    HTML
  end
end
~~~

~~~ruby
rp = RbMarkPlot.new
rp.set title: "Example Plot"
rp.plot "sin(x)", w:"lines"
~~~