# rbplotly line plot usage

~~~ruby
require 'rbplotly'

plot = Plotly::Plot.new
flip = -1
x = (0...100).map { |i| i.to_f / 10 }
(0..5).each do |i|
  trace = {
    x: x,
    y: (1...100).map { |j| Math.sin(j.to_f / 10 + i) },
    line: { shape: :spline },
    mode: :lines
  }
  plot.data.push(trace)
end
plot
~~~
