# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mojikun/version'

Gem::Specification.new do |gem|
  gem.name          = "mojikun"
  gem.version       = Mojikun::VERSION
  gem.authors       = ["Steve Klabnik"]
  gem.email         = ["steve@steveklabnik.com"]
  gem.description   = %q{A simple programming language, using emoji.}
  gem.summary       = %q{A simple programming language, using emoji.}
  gem.homepage      = "https://github.com/steveklabnik/mojikun"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
