require 'thor/runner'

Gem.post_install do |installed|
  $stderr.puts "[I] installing thor tasks for #{installed.gem}"
  bin = File.expand_path(File.dirname(__FILE__) + '/../../bin/install-gist.rb')
  installer = Thor::Runner.new([], as: 'install-gist', force: true)
  installer.install(bin)
end

Gem.pre_uninstall do |uninstalled|
  $stderr.puts "[I] uninstalling thor tasks for thor-install-gist"
  Thor::Runner.new.uninstall('install-gist')
end
