
# k-means clustering with [rumale](https://github.com/yoshoku/rumale)

## super simple k-means clustering demo

~~~ruby
require "numo/narray"
require "rumale"
samples = Numo::DFloat[[1, 2], [1, 4], [1, 0],[10, 2], [10, 4], [10, 0]]
analyzer = Rumale::Clustering::KMeans.new(n_clusters: 2, max_iter: 50)
cluster_labels = analyzer.fit_predict(samples)
~~~


We can see that the rumale `analyzer` separately labeled the first 3points and the last 3points.

## Visualizing clusters with [rbplotly](https://github.com/ash1day/rbplotly)

Next we visualize the cluster with rbplotly

~~~ruby
cluster0 = samples[0..2,0..1]
cluster1 = samples[3..5,0..1]
x0 = cluster0[0..-1,0].to_a
y0 = cluster0[0..-1,1].to_a
x1 = cluster1[0..-1,0].to_a
y1 = cluster1[0..-1,1].to_a
trace0 = {x:x0, y:y0, type: :scatter, mode: :markers}
trace1 = {x:x1, y:y1, type: :scatter, mode: :markers}
plot = Plotly::Plot.new(data: [trace0, trace1])
~~~

The end
