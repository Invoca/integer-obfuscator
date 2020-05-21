require 'rubygems'
require 'test/unit'
require 'minitest/reporters'
Minitest::Reporters.use! [
  Minitest::Reporters::DefaultReporter.new,
  Minitest::Reporters::JUnitReporter.new
]

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require 'integer-obfuscator'
