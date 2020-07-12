
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rubydown/version"

Gem::Specification.new do |spec|
  spec.name          = "rubydown"
  spec.version       = Rubydown::VERSION
  spec.authors       = ["Yusuke Sangenya", "Kozo Nishida", "Kazuhiro Nishiyama"]
  spec.email         = ["kozo.nishida@gmail.com"]
  spec.license       = 'MIT'
  spec.summary       = "Pure Ruby R Markdown clone."
  spec.description   = "rubydown is R Markdown clone for Rubyists."
  spec.homepage      = "https://github.com/sciruby-jp/rubydown"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
#    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/sciruby-jp/rubydown"
#    spec.metadata["changelog_uri"] = "https//github.com/sciruby-jp/rubydown/blob/master/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "kramdown", "~> 2.1"
  spec.add_dependency "daru", "~> 0.2"
  spec.add_dependency "numo-narray", "~> 0.9.1"
  spec.add_dependency "numo-gnuplot", "~> 0.2.4"
  spec.add_dependency "rbplotly", "~> 0.1.2"
  spec.add_dependency "charty", "~> 0.2.0"
  spec.add_dependency "matplotlib", "~> 1.0.0"
  spec.add_dependency 'listen', '~> 3.0'

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "test-unit", "~> 3.3"
end
