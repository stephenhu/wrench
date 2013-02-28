# -*- encoding: utf-8 -*-
require File.expand_path('../lib/wrench/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["stephenhu"]
  gem.email         = ["epynonymous@outlook.com"]
  gem.license       = "MIT"
  gem.description   = %q{tool for ruby web development}
  gem.summary       = %q{command line tool for ruby web development}
  gem.homepage      = "http://github.com/stephenhu/wrench"

  gem.files         = `git ls-files`.split($\)
  gem.bindir        = "bin"
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "wrench"
  gem.require_paths = ["lib"]
  gem.version       = Wrench::VERSION
end

