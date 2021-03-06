require 'shuhari'

module Shuhari
  module Platform

    module_function

    def rvm?
      !`which rvm`.empty?
    end

    def unix?
      osx? or linux?
    end

    def osx?
      os == :osx
    end

    def linux?
      os == :linux
    end

    def windows?
      os == :windows
    end

    def os
      @os ||= case RUBY_PLATFORM
              when /darwin/ then :osx
              when /linux/ then :linux
              when /win32/, /mingw32/ then :windows
              end
    end
  end
end
