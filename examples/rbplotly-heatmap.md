# rbplotly heatmap usage

~~~ruby
require 'rbplotly'

z = [
  [1, 20, 30],
  [20, 1, 60],
  [30, 60, 1]
]

data = [{
  z: z,
  type: :heatmap
}]

plot = Plotly::Plot.new(data: data)
~~~

~~~ruby
n = 10
data = {
  x: (1..n).map { |i| "x#{i}" },
  y: (1..n).map { |i| "y#{i}" },
  z: (1..n).map { (1..n).map { rand(10) } },
  type: :heatmap
}

layout = {
  width:  500,
  height: 500
}

plot = Plotly::Plot.new(data: [data], layout: layout)
~~~
