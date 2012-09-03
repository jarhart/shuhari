Feature: RSpec Kata Generation

  Scenario: All Platforms
    When I run `shuhari new FizzBuzz --rspec`
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
      require 'spec_helper'

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
      require 'fizz_buzz'
      require 'rspec'

      # Requires supporting files with custom matchers and macros, etc,
      # in ./support/ and its subdirectories.
      Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

      RSpec.configure do |config|
      end
      """
    And the file "fizz_buzz/Guardfile" should contain:
      """
      guard 'rspec', :version => 2 do
        watch(%r{^spec/.+_spec\.rb$})
        watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
        watch('spec/spec_helper.rb')  { "spec/" }
      end
      """
    And the file "fizz_buzz/shuhari.yml" should contain:
      """
      project_name: FizzBuzz
      test_framework: rspec
      """

  @osx
  Scenario: OS X
    When I run `shuhari new FizzBuzz --rspec`
    Then the file "fizz_buzz/Gemfile" should contain:
      """
      group :development do
        gem 'rspec'
        gem 'guard-rspec'
        gem 'coolline', :require => false
        gem 'growl'
        # gem 'growl_notify'
        # gem 'ruby_gntp'
        gem 'rb-fsevent'
      end
      """

  @linux
  Scenario: Linux
    When I run `shuhari new FizzBuzz --rspec`
    Then the file "fizz_buzz/Gemfile" should contain:
      """
      group :development do
        gem 'rspec'
        gem 'guard-rspec'
        gem 'coolline', :require => false
        gem 'libnotify'
        gem 'rb-inotify'
      end
      """

  @windows
  Scenario: Windows
    When I run `shuhari new FizzBuzz --rspec`
    Then the file "fizz_buzz/Gemfile" should contain:
      """
      group :development do
        gem 'rspec'
        gem 'guard-rspec'
        gem 'rb-notifu'
        gem 'win32console'
        gem 'wdm'
      end
      """
