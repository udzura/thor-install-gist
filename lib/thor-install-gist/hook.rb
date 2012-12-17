require 'thor/runner'

Gem.post_install do |installed|
  $stderr.puts "[I] installing thor tasks for #{installed.gem}"
  bin = File.expand_path(File.dirname(__FILE__) + '/../../bin/install-gist.rb')
  installer = Thor::Runner.new([], as: 'install-gist', force: true)
  installer.install(bin)
end

Gem.pre_uninstall do |uninstalled|
  $stderr.puts "[I] uninstalling thor tasks for thor-install-gist"
  begin
    Thor::Runner.new.uninstall('install-gist')
  rescue Thor::Error => e
    if e.message =~ /Can't find module/
      $stderr.puts "[W] uninstalling thor tasks failed! you just have uninstalled by yourself?"
      $stderr.puts "[W] skip uninstall"
      true
    else
      raise e
    end
  end
end
