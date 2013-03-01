# -*- encoding: utf-8 -*-
require File.expand_path('../lib/wrench/version', __FILE__)

Gem::Specification.new do |gem|

  gem.authors       = ["stephen hu"]
  gem.email         = ["epynonymous@outlook.com"]
  gem.license       = "MIT"
  gem.date          = "2013-03-02"
  gem.description   = %q{a tool for ruby web development}
  gem.summary       = %q{command line tool for ruby web development}
  gem.homepage      = "http://github.com/stephenhu/wrench"

  gem.files         = `git ls-files`.split($\)
  gem.bindir        = "bin"
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "wrench"
  gem.require_paths = ["lib"]
  gem.version       = Wrench::VERSION

  gem.add_runtime_dependency( "colorize", "~> 0.5.8" )
  gem.add_runtime_dependency( "thor", "~> 0.17.0" )
  gem.add_runtime_dependency( "zip", "~> 2.0.2" )

end

