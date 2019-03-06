# rbplotly bar chart usage


~~~ruby
require 'rbplotly'

trace = {
  x: %w(giraffes orangutans monkeys),
  y: [20, 14, 23],
  type: :bar
}

plot = Plotly::Plot.new(data: [trace])
~~~


~~~ruby
trace1 = {
  x:    %w(giraffes orangutans monkeys),
  y:    [20, 14, 23],
  type: :bar,
  name: 'SF Zoo'
}
trace2 = {
  x:    %w(giraffes orangutans monkeys),
  y:    [12, 18, 29],
  type: :bar,
  name: 'LA Zoo'
}

plot = Plotly::Plot.new(data: [trace1, trace2])
~~~

~~~ruby
plot.layout.barmode = :stack
plot
~~~

~~~ruby
trace1 = {
  x:    %w(giraffes orangutans monkeys),
  y:    [20, 14, 23],
  type: :bar,
  name: 'SF Zoo'
}
trace2 = {
  x:    %w(giraffes orangutans monkeys),
  y:    [12, 18, 29],
  type: :bar,
  name: 'LA Zoo'
}

plot = Plotly::Plot.new(data: [trace1, trace2], layout: { barmode: :stack } )
~~~
