require 'bundler'
Bundler.setup

Bundler::GemHelper.install_tasks

require 'yard'
YARD::Rake::YardocTask.new

require "rake/testtask"
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test
