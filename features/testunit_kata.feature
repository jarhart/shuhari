Feature: Test::Unit Kata Generation

  Scenario: All Platforms
    When I run `shuhari new FizzBuzz --testunit`
    Then a directory named "fizz_buzz" should exist
    And the following files should exist:
      |fizz_buzz/Gemfile                |
      |fizz_buzz/Guardfile              |
      |fizz_buzz/lib/fizz_buzz.rb       |
      |fizz_buzz/test/test_helper.rb    |
      |fizz_buzz/test/fizz_buzz_test.rb |
      |fizz_buzz/shuhari.yml            |
    And the file "fizz_buzz/test/fizz_buzz_test.rb" should contain:
      """
      require 'test_helper'

      class FizzBuzzTest < Test::Unit::TestCase
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
      require 'test/unit'
      """
    And the file "fizz_buzz/Guardfile" should contain:
      """
      guard :test do
        watch(%r{^lib/(.+)\.rb$})     { |m| "test/#{m[1]}_test.rb" }
        watch(%r{^test/.+_test\.rb$})
        watch('test/test_helper.rb')  { "test" }
      end
      """
    And the file "fizz_buzz/shuhari.yml" should contain:
      """
      project_name: FizzBuzz
      test_framework: testunit
      """

  @osx
  Scenario: OS X
    When I run `shuhari new FizzBuzz --testunit`
    Then the file "fizz_buzz/Gemfile" should contain:
      """
      group :development do
        gem 'test-unit'
        gem 'guard-test'
        gem 'coolline', :require => false
        gem 'growl'
        # gem 'growl_notify'
        # gem 'ruby_gntp'
        gem 'rb-fsevent'
      end
      """

  @linux
  Scenario: Linux
    When I run `shuhari new FizzBuzz --testunit`
    Then the file "fizz_buzz/Gemfile" should contain:
      """
      group :development do
        gem 'test-unit'
        gem 'guard-test'
        gem 'coolline', :require => false
        gem 'libnotify'
        gem 'rb-inotify'
      end
      """

  @windows
  Scenario: Windows
    When I run `shuhari new FizzBuzz --testunit`
    Then the file "fizz_buzz/Gemfile" should contain:
      """
      group :development do
        gem 'test-unit'
        gem 'guard-test'
        gem 'rb-notifu'
        gem 'win32console'
        gem 'wdm'
      end
      """
