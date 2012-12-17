# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'thor-install-gist/version'

Gem::Specification.new do |gem|
  gem.name          = "thor-install-gist"
  gem.version       = Thor::InstallGist::VERSION
  gem.authors       = ["Uchio KONDO"]
  gem.email         = ["udzura@udzura.jp"]
  gem.description   = %q{Install thor tasks from gists}
  gem.summary       = %q{Install thor tasks from gists}
  gem.homepage      = "https://github.com/udzura/thor-install-gist"

  gem.files         = `git ls-files`.split($/)
  #gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'thor', '>= 0'
end
