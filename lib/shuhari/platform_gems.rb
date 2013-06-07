require 'shuhari'
require 'erb'

module Shuhari
  module PlatformGems
    include Platform

    TEMPLATES = File.expand_path('../../templates', File.dirname(__FILE__))
    TEMPLATE_FILE = File.expand_path('platform_gems.erb', TEMPLATES)

    protected

    def platform_gems
      b = binding
      erb = ERB.new(File.read(TEMPLATE_FILE))
      erb.result(b).strip
    end
  end
end
