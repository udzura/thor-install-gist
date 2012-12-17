require 'thor/runner'

Gem.pre_uninstall do |uninstalled|
  if uninstalled.instance_variable_get(:@gem) == "thor-install-gist"
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
end
