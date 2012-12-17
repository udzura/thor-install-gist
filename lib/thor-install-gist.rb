require 'thor/runner'
require 'open-uri'
require 'json'

class Thor
  class InstallGist < ::Thor
    class ThorTaskNotFound < StandardError
    end

    namespace 'install'
    desc 'gist GIST_ID', 'install a thor task from the specified gist id'
    method_options :as => :string, :force => :boolean
    def gist(gist_id)
      @gist_id = case gist_id
      when /^\d+$/
        gist_id
      when %r|^https?://gist\.github\.com/\d+|
        URI.parse(gist_id).path.scan(/\d+/).first
      when %r|^gist?:(//)?\d+|
        gist = URI.parse(gist_id)
        gist.opaque || gist.host
      else
        raise "Invalid gist uri scheme: #{gist_id}"
      end

      json = JSON.parse open(api_path).read
      if file_info = json["files"].find {|f| f[0] =~ /(thor|\.rb$)/i }
        raw_url = file_info[1]["raw_url"]
        Thor::Runner.new(["install", raw_url], options).install raw_url
      else
        raise ThorTaskNotFound, "Cannot find thor task file in your gist"
      end
    end

    private
    def api_path
      "https://api.github.com/gists/#{@gist_id}"
    end
  end
end
require "thor-install-gist/version"
