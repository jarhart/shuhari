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

      RSpec.configure do |config|
        config.treat_symbols_as_metadata_keys_with_true_values = true
        config.run_all_when_everything_filtered = true
        config.filter_run :focus

        # Run specs in random order to surface order dependencies. If you find an
        # order dependency and want to debug it, you can fix the order by providing
        # the seed, which is printed after each run.
        #     --seed 1234
        config.order = 'random'

        # Requires supporting files with custom matchers and macros, etc,
        # in ./support/ and its subdirectories.
        Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each { |f| require f }
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
      source 'https://rubygems.org'

      group :development do
        gem 'rspec'
        gem 'guard-rspec'
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
    When I run `shuhari new FizzBuzz --rspec`
    Then the file "fizz_buzz/Gemfile" should contain:
      """
      source 'https://rubygems.org'

      group :development do
        gem 'rspec'
        gem 'guard-rspec'
        gem 'coolline', :require => false
        gem 'libnotify'
        # gem 'ruby_gntp'
        gem 'rb-inotify'
      end
      """

  @windows
  Scenario: Windows
    When I run `shuhari new FizzBuzz --rspec`
    Then the file "fizz_buzz/Gemfile" should contain:
      """
      source 'https://rubygems.org'

      group :development do
        gem 'rspec'
        gem 'guard-rspec'
        gem 'rb-notifu'
        gem 'win32console'
        # gem 'ruby_gntp'
        gem 'wdm'
      end
      """
