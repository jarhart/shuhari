Feature: Getting Help

  Scenario: General help
    When I run `shuhari help`
    Then the output should contain:
      """
      Commands:
        shuhari help [COMMAND]  # Describe available commands or one specific command
        shuhari new [NAME]      # Create a new Kata project
      """

  Scenario: General help inside a project
    Given a file named "shuhari.yml" with:
      """
      project_name: FizzBuzz
      test_framework: rspec
      """
    When I run `shuhari help`
    Then the output should contain:
      """
      Commands:
        shuhari empty           # Restart the Kata with empty mind and project
        shuhari help [COMMAND]  # Describe available commands or one specific command
        shuhari new [NAME]      # Create a new Kata project
      """

  Scenario: Help about the "new" task
    When I run `shuhari help new`
    Then the output should contain:
      """
      Usage:
        shuhari new [NAME]

      Options:
        -r, [--rspec]          # Test using RSpec
                               # Default: true
        -m, [--minitest]       # Test using Minitest::Unit
        -s, [--minitest-spec]  # Test using Minitest::Spec
        -t, [--testunit]       # Test using Test::Unit
        -c, [--cucumber]       # Test using Cucumber
        -g, [--gemset]         # Create .rvmrc to use a gemset
                               # Default: true

      Create a new Kata project
      """

  Scenario: Help about the "empty" task
    Given a file named "shuhari.yml" with:
      """
      project_name: FizzBuzz
      test_framework: rspec
      """
    When I run `shuhari help empty`
    Then the output should contain:
      """
      Usage:
        shuhari empty

      Restart the Kata with empty mind and project
      """
