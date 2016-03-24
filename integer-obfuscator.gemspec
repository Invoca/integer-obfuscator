# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "integer_obfuscator/version"

Gem::Specification.new do |s|
  s.name        = "integer-obfuscator"
  s.version     = IntegerObfuscator::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["John Nishinaga"]
  s.email       = ["jingoro@casa-z.org"]
  s.homepage    = "https://github.com/patdeegan/integer-obfuscator"
  s.summary     = "integer-obfuscator-#{IntegerObfuscator::VERSION}"
  s.description = "Obfuscate 32-bit Integers using a 32-bit block cipher based on SKIPJACK"

  s.rubyforge_project = "integer-obfuscator"

  s.files =
    ['Gemfile',
    'MIT-LICENSE.txt',
    'README.md',
    'Rakefile',
    'integer-obfuscator.gemspec',
    'lib/cipher/skip32.rb',
    'lib/integer-obfuscator.rb',
    'lib/integer_obfuscator/version.rb',
    'skip32.c.md',
    'test/helper.rb',
    'test/test_integer_obfuscator.rb',
    'test/test_skip32.rb']

  s.test_files    = ["test/helper.rb", "test/test_integer_obfuscator.rb", "test/test_skip32.rb"]
  s.executables   = []
  s.require_paths = ["lib"]

  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency 'yard'
  s.add_development_dependency 'bluecloth'

end
