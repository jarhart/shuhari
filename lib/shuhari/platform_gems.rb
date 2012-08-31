require 'shuhari'

module Shuhari
  module PlatformGems

    protected

    def osx_gems
      [ "gem 'growl'",
        "# gem 'growl_notify'",
        "# gem 'ruby_gntp'" ]
    end

    def linux_gems
      [ "gem 'libnotify'" ]
    end

    def windows_gems
      [ "gem 'rb-notifu'",
        "gem 'win32console'" ]
    end

    def platform_gems
      case Platform.os
      when :osx then osx_gems
      when :linux then linux_gems
      when :windows then windows_gems
      else []
      end.join "\n  "
    end
  end
end
