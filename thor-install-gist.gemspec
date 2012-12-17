# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'thor-install-gist/version'

Gem::Specification.new do |gem|
  gem.name          = "thor-install-gist"
  gem.version       = Thor::InstallGist::VERSION
  gem.authors       = ["Uchio KONDO"]
  gem.email         = ["udzura@udzura.jp"]
  gem.description   = %q{A thor sub-command to install thor tasks from gists}
  gem.summary       = %q{A thor sub-command to install thor tasks from gists}
  gem.homepage      = "https://github.com/udzura/thor-install-gist"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.post_install_message = (<<-EOM).gsub(/^    /, '')

    \e[37mThank you for installing thor-install-gist!
    You can use a task `thor install:gist' after you run:

        \e[1m\e[33m$ \e[36mthor-install-gist-init

    \e[0m\e[37mThen the command will be installed into your `$HOME/.thor'
    Enjoy!\e[0m

  EOM

  gem.add_runtime_dependency 'thor', '>= 0'
end
