
# Charty Usage

## You can write Markdown!

- item1
- item2

~~~ruby

require 'charty'
charty = Charty.new(:pyplot)

bar = charty.bar do
  series [0,1,2,3,4], [10,40,20,90,70]
  series [0,1,2,3,4], [90,80,70,60,50]
  series [0,1,2,3,4,5,6,7,8], [50,60,20,30,10, 90, 0, 100, 50]
  range x: 0..10, y: 1..100
  xlabel 'foo'
  ylabel 'bar'
  title 'bar plot'
end
bar.render("bar_matplot.png")
~~~

