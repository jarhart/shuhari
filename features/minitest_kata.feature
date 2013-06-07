Feature: Minitest Kata Generation

  Scenario: All Platforms
    When I run `shuhari new FizzBuzz --minitest`
    Then a directory named "fizz_buzz" should exist
    And the following files should exist:
      |fizz_buzz/Gemfile                |
      |fizz_buzz/Guardfile              |
      |fizz_buzz/lib/fizz_buzz.rb       |
      |fizz_buzz/test/test_helper.rb    |
      |fizz_buzz/test/test_fizz_buzz.rb |
      |fizz_buzz/shuhari.yml            |
    And the file "fizz_buzz/test/test_fizz_buzz.rb" should contain:
      """
      require File.expand_path('test_helper', File.dirname(__FILE__))

      class TestFizzBuzz < MiniTest::Unit::TestCase
      end
      """
    And the file "fizz_buzz/lib/fizz_buzz.rb" should contain:
      """
      class FizzBuzz
      end
      """
    And the file "fizz_buzz/test/test_helper.rb" should contain:
      """
      $LOAD_PATH.unshift File.expand_path('../lib', File.dirname(__FILE__))

      require 'fizz_buzz'
      require 'minitest/autorun'
      require 'minitest/pride'
      """
    And the file "fizz_buzz/Guardfile" should contain:
      """
      guard 'minitest' do
        watch(%r|^test/test_(.*)\.rb|)
        watch(%r|^lib/(.*)\.rb|)            { |m| "test/test_#{m[1]}.rb" }
        watch(%r|^test/test_helper\.rb|)    { "test" }
      end
      """
    And the file "fizz_buzz/shuhari.yml" should contain:
      """
      project_name: FizzBuzz
      test_framework: minitest
      """

  @osx
  Scenario: OS X
    When I run `shuhari new FizzBuzz --minitest`
    Then the file "fizz_buzz/Gemfile" should contain:
      """
      source 'https://rubygems.org'

      group :development do
        gem 'minitest'
        gem 'guard-minitest'
        gem 'coolline', :require => false
        gem 'growl'
        # gem 'growl_notify'
        # gem 'ruby_gntp'
        # gem 'terminal-notifier-guard'
        gem 'rb-fsevent'
      end
      """

  @linux
  Scenario: Linux
    When I run `shuhari new FizzBuzz --minitest`
    Then the file "fizz_buzz/Gemfile" should contain:
      """
      source 'https://rubygems.org'

      group :development do
        gem 'minitest'
        gem 'guard-minitest'
        gem 'coolline', :require => false
        gem 'libnotify'
        # gem 'ruby_gntp'
        gem 'rb-inotify'
      end
      """

  @windows
  Scenario: Windows
    When I run `shuhari new FizzBuzz --minitest`
    Then the file "fizz_buzz/Gemfile" should contain:
      """
      source 'https://rubygems.org'

      group :development do
        gem 'minitest'
        gem 'guard-minitest'
        gem 'rb-notifu'
        gem 'win32console'
        # gem 'ruby_gntp'
        gem 'wdm'
      end
      """
