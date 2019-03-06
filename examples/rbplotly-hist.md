# rbplotly histogram usage

~~~ruby
require 'rbplotly'

data = [{ x: (1..500).map { rand }, type: :histogram }]

plot = Plotly::Plot.new(data: data)
~~~
