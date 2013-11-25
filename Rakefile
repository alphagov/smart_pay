#!/usr/bin/env rake

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

Bundler::GemHelper.install_tasks

require 'rake/testtask'

require 'gem_publisher'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task :publish_gem do |t|
  gem = GemPublisher.publish_if_updated("smart_pay.gemspec", :rubygems)
  puts "Published #{gem}" if gem
end

task :default => :test
