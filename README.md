# rubydown

[![CircleCI](https://circleci.com/gh/sciruby-jp/rubydown/tree/master.svg?style=svg)](https://circleci.com/gh/sciruby-jp/rubydown/tree/master)
[![Build status](https://ci.appveyor.com/api/projects/status/rroa24x9jgdwuka5?svg=true)](https://ci.appveyor.com/project/kozo2/rubydown)

*rubydown* is pure-Ruby [R Markdown](https://rmarkdown.rstudio.com/) clone.
It takes a markdown source file, executes the code chunks, captures the output, and stitches the output into the destination file.

Python also has R Markdown like packages.
If you have interest about making reproducible reports, please also refer to the following projects.

https://github.com/jankatins/knitpy

https://github.com/pystitch/stitch


## Install

```
apt install gnuplot # When you use numo-gnuplot in your workflow markdown
gem install specific_install
gem specific_install https://github.com/sciruby-jp/rubydown
```

## Usage (example with [rumale](https://github.com/yoshoku/rumale) and [rdatasets](https://github.com/kojix2/rdatasets))

```
gem install rumale rdatasets
git clone git://github.com/sciruby-jp/rubydown
cd rubydown/examples
rubydown -i rumale.md -o rumale.html
```
