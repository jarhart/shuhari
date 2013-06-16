require 'shuhari'

module Shuhari
  module PlatformGems

    protected

    def osx_gems
      unix_gems +
      [ "gem 'growl'",
        "# gem 'growl_notify'",
        "# gem 'ruby_gntp'",
        "gem 'rb-fsevent'",
        "gem 'shuhari'" ]
    end

    def linux_gems
      unix_gems +
      [ "gem 'libnotify'",
        "gem 'rb-inotify'",
        "gem 'shuhari'" ]
    end

    def unix_gems
      [ "gem 'coolline', :require => false",
        "gem 'shuhari'" ]
    end

    def windows_gems
      [ "gem 'rb-notifu'",
        "gem 'win32console'",
        "gem 'wdm'",
        "gem 'shuhari'" ]
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
