# -*- encoding: utf-8 -*-
require File.expand_path('../lib/shuhari/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jason Arhart"]
  gem.email         = ["jarhart@gmail.com"]
  gem.description   = %q{Shuhari generates new projects for doing TDD Kata.}
  gem.summary       = %q{TDD Kata project generator}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "shuhari"
  gem.require_paths = ["lib"]
  gem.version       = Shuhari::VERSION

  gem.add_dependency "thor", "~> 0.14"
end
