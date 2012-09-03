# Shuhari

Shuhari generates new projects for doing TDD Kata.

## Installation

Switch to your global gemset if you're using rvm:

    $ rvm use @global

Install the gem:

    $ gem install shuhari

## Usage

Get help on shuhari commands:

    $ shuhari help

Create your kata project:

    $ shuhari new MyAwesomeKata

Bundle your gems:

    $ cd my_awesome_kata
    $ bundle

Start guard to run your tests automatically:

    $ guard

Do your kata! Guard will monitor your files and run your tests automatically
whenever you make a change.

When you finish your kata:

    $ shuhari empty

Your project is empty again (your tests and code are removed) and you can
restart your kata!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
