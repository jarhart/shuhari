Feature: Minitest::Spec Kata Generation

  Scenario: All Platforms
    When I run `shuhari new FizzBuzz --minitest_spec`
    Then a directory named "fizz_buzz" should exist
    And the following files should exist:
      |fizz_buzz/Gemfile                |
      |fizz_buzz/Guardfile              |
      |fizz_buzz/lib/fizz_buzz.rb       |
      |fizz_buzz/spec/spec_helper.rb    |
      |fizz_buzz/spec/fizz_buzz_spec.rb |
      |fizz_buzz/shuhari.yml            |
    And the file "fizz_buzz/spec/fizz_buzz_spec.rb" should contain:
      """
      require File.expand_path('spec_helper', File.dirname(__FILE__))

      describe FizzBuzz do
      end
      """
    And the file "fizz_buzz/lib/fizz_buzz.rb" should contain:
      """
      class FizzBuzz
      end
      """
    And the file "fizz_buzz/spec/spec_helper.rb" should contain:
      """
      $LOAD_PATH.unshift File.expand_path('../lib', File.dirname(__FILE__))

      require 'fizz_buzz'
      require 'minitest/autorun'
      require 'minitest/pride'
      """
    And the file "fizz_buzz/Guardfile" should contain:
      """
      guard 'minitest' do
        watch(%r|^spec/(.*)_spec\.rb|)
        watch(%r|^lib/(.*)\.rb|)            { |m| "spec/#{m[1]}_spec.rb" }
        watch(%r|^spec/spec_helper\.rb|)    { "spec" }
      end
      """
    And the file "fizz_buzz/shuhari.yml" should contain:
      """
      project_name: FizzBuzz
      test_framework: minitest_spec
      """

  @osx
  Scenario: OS X
    When I run `shuhari new FizzBuzz --minitest_spec`
    Then the file "fizz_buzz/Gemfile" should contain:
      """
      group :development do
        gem 'minitest'
        gem 'guard-minitest'
        gem 'coolline', :require => false
        gem 'growl'
        # gem 'growl_notify'
        # gem 'ruby_gntp'
        gem 'rb-fsevent'
      end
      """

  @linux
  Scenario: Linux
    When I run `shuhari new FizzBuzz --minitest_spec`
    Then the file "fizz_buzz/Gemfile" should contain:
      """
      group :development do
        gem 'minitest'
        gem 'guard-minitest'
        gem 'coolline', :require => false
        gem 'libnotify'
        gem 'rb-inotify'
      end
      """

  @windows
  Scenario: Windows
    When I run `shuhari new FizzBuzz --minitest_spec`
    Then the file "fizz_buzz/Gemfile" should contain:
      """
      group :development do
        gem 'minitest'
        gem 'guard-minitest'
        gem 'rb-notifu'
        gem 'win32console'
        gem 'wdm'
      end
      """
