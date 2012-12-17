require 'thor/runner'

$stderr.puts "[I] installing thor tasks for thor-install-gist"
bin = File.expand_path(File.dirname(__FILE__) + '/../../bin/install-gist.rb')
installer = Thor::Runner.new([], as: 'install-gist', force: true)
installer.install(bin)
$stderr.puts "[I] install done!"

exit 0
