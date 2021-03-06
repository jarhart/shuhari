Feature: Cucumber Kata Generation

  Scenario: All Platforms
    When I run `shuhari new FizzBuzz --cucumber`
    Then a directory named "fizz_buzz" should exist
    And the following files should exist:
      |fizz_buzz/Gemfile                            |
      |fizz_buzz/Guardfile                          |
      |fizz_buzz/lib/fizz_buzz.rb                   |
      |fizz_buzz/features/fizz_buzz.feature         |
      |fizz_buzz/features/support/env.rb            |
      |fizz_buzz/features/step_definitions/steps.rb |
      |fizz_buzz/shuhari.yml                        |
    And the file "fizz_buzz/features/fizz_buzz.feature" should contain:
      """
      Feature: Fizz Buzz
      """
    And the file "fizz_buzz/lib/fizz_buzz.rb" should contain:
      """
      class FizzBuzz
      end
      """
    And the file "fizz_buzz/features/support/env.rb" should contain:
      """
      $LOAD_PATH.unshift File.expand_path('../../lib', File.dirname(__FILE__))

      require 'fizz_buzz'
      require 'rspec/expectations'
      """
    And the file "fizz_buzz/Guardfile" should contain:
      """
      guard 'cucumber' do
        watch(%r{^lib/.+\.rb$}) { 'features' }
        watch(%r{^features/.+\.feature$})
        watch(%r{^features/(support|step_definitions)/.+$}) { 'features' }
      end
      """
    And the file "fizz_buzz/shuhari.yml" should contain:
      """
      project_name: FizzBuzz
      test_framework: cucumber
      """

  @osx
  Scenario: OS X
    When I run `shuhari new FizzBuzz --cucumber`
    Then the file "fizz_buzz/Gemfile" should contain:
      """
      source 'https://rubygems.org'

      group :development do
        gem 'cucumber'
        gem 'rspec'
        gem 'guard-cucumber'
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
    When I run `shuhari new FizzBuzz --cucumber`
    Then the file "fizz_buzz/Gemfile" should contain:
      """
      source 'https://rubygems.org'

      group :development do
        gem 'cucumber'
        gem 'rspec'
        gem 'guard-cucumber'
        gem 'coolline', :require => false
        gem 'libnotify'
        # gem 'ruby_gntp'
        gem 'rb-inotify'
      end
      """

  @windows
  Scenario: Windows
    When I run `shuhari new FizzBuzz --cucumber`
    Then the file "fizz_buzz/Gemfile" should contain:
      """
      source 'https://rubygems.org'

      group :development do
        gem 'cucumber'
        gem 'rspec'
        gem 'guard-cucumber'
        gem 'rb-notifu'
        gem 'win32console'
        # gem 'ruby_gntp'
        gem 'wdm'
      end
      """
