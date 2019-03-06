# rbplotly pie chart usage

## Basic pie chart

~~~ruby
require 'rbplotly'

data = [{
  labels: %w(Residential Non-Residential Utility),
  values: [19, 26, 55],
  type: :pie
}]

layout = { title: 'Forcasted 2014 U.S. PV Installations by Market Segment' }

plot = Plotly::Plot.new(data: data, layout: layout )
~~~

## Donut chart

~~~ruby
trace1 = {
  name: 'GHG Emissions',
  values: [16, 15, 12, 6, 5, 4, 42],
  domain: { x: [0, 0.5] },

  labels: %w(US China European Union Russian Federation Brazil India Rest\ of\ World),
  hoverinfo: :'label+percent+name',
  hole: 0.4,
  type: :pie,
}

trace2 = trace1.merge({
  name: 'CO2 Emissions',
  values: [27, 11, 25, 8, 1, 3, 25],
  domain: { x: [0.5, 1] }
})

plot = Plotly::Plot.new(data: [trace1, trace2])
~~~
