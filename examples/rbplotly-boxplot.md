# rbplotly boxplot usage

~~~ruby
require 'rbplotly'

n = 50
y0 = n.times.map { rand(-1.0..0.0) }
y1 = n.times.map { rand(0.0..1.0) }

trace0 = {
  y: y0,
  type: :box
}

trace1 = {
  y: y1,
  type: :box
}

data = [trace0, trace1]

plot = Plotly::Plot.new(data: data)
~~~

## Horizontal boxplot

~~~ruby
n = 50
x0 = n.times.map { rand(-1.0..0.0) }
x1 = n.times.map { rand(0.0..1.0) }

trace0 = {
  x: x0,
  type: :box
}

trace1 = {
  x: x1,
  type: :box
}

data = [trace0, trace1]

plot = Plotly::Plot.new(data: data)
~~~


## boxplot with the points

~~~ruby
trace = {
    y: [0, 1, 1, 2, 3, 5, 8, 13, 21],
    boxpoints: :all,
    jitter: 0.3,
    pointpos: -1.8,
    type: :box
  }

plot = Plotly::Plot.new(data: [trace])
~~~
