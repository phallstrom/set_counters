# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'set_counters/version'

Gem::Specification.new do |gem|
  gem.name          = "set_counters"
  gem.version       = SetCounters::VERSION
  gem.authors       = ["Philip Hallstrom"]
  gem.email         = ["philip@pjkh.com"]
  gem.description   = %q{Easy setting of multiple counters in Active Record models.}
  gem.summary       = %q{Easy setting of multiple counters in Active Record models.}
  gem.homepage      = "https://github.com/phallstrom/set_counters"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'activerecord', '~> 4.1'

  gem.add_development_dependency 'bundler', '~> 1.7'
  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'sqlite3'
end
