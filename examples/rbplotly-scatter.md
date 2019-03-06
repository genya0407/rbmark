# rbplotly scatter plot usage

## Simple scatter Plot

~~~ruby
require 'rbplotly'

n = 100
x = n.times.map { rand(-2.0..2.0) }
y = n.times.map { rand(-1.0..1.0) }
trace = { x: x, y: y, mode: :markers }

plot = Plotly::Plot.new(data: [trace])
plot.layout.title = 'Simple Scatter Plot'
plot
~~~

## Line and scatter plots

~~~ruby
n = 100

x  = n.times.map { |i| i.to_f / (n - 1) }
y0 = n.times.map { rand(-2.0..2.0) + 5 }
y1 = n.times.map { rand(-2.0..2.0) }
y2 = n.times.map { rand(-2.0..2.0) - 5 }

trace0 = { x: x, y: y0, type: :scatter, mode: :markers }
trace1 = { x: x, y: y1, type: :scatter, mode: :'markers+lines' }
trace2 = { x: x, y: y2, type: :scatter, mode: :lines }

plot = Plotly::Plot.new(data: [trace0, trace1, trace2])
plot.layout.title = 'Line and Scatter Plots'
plot
~~~

## Style scatter plots

~~~ruby
n = 100
trace0 = {
  x: n.times.map { rand(-2.0..2.0) },
  y: n.times.map { rand(-1.0..1.0) },
  name: 'Red',
  mode: :markers,
  marker: {
    size: 15,
    color: 'rgba(200, 0, 0, .5)',
    line: { width: 2, color: 'rgb(0, 0, 0, .5)' }
  }
}
trace1 = {
  x: n.times.map { rand(-2.0..2.0) },
  y: n.times.map { rand(-1.0..1.0) },
  name: 'Blue',
  mode: :markers,
  marker: {
    size: 10,
    color: 'rgba(0, 0, 200, .5)',
    line: { width: 1, color: 'rgb(0, 0, 0, .5)' }
  }
}

layout = {
  title: 'Styled Scatter',
  xaxis: { zeroline: false },
  yaxis: { zeroline: false }
}

plot = Plotly::Plot.new(data: [trace0, trace1], layout: layout)
~~~
