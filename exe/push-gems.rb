#!/usr/bin/env ruby

require_relative '../lib/puppet-module-gems/constants.rb'
include PuppetModuleGems::Constants

OWNERS = [
"bradejr@puppetlabs.com",
"ciaran.mccrisken@puppet.com",
"daniel.carabas@puppet.com",
"david.schmitt@puppet.com",
"david.swan@puppet.com",
"loredana.ionce@puppet.com",
"michael.lombardi@puppet.com",
"morgan@puppetlabs.com",
"paula@puppet.com",
"sheena@puppet.com",
"tp@puppet.com",
]

Dir["#{PKG_PATH}/*.gem"].each do |file|
  gem = File.basename(file).split('.gem').first
  gem_version = gem.split('-').last
  gem_name = gem.split("-#{gem_version}").first

  puts "## Pushing #{gem_name} to https://rubygems.org."
  value = `gem push #{file}`
  puts value

  puts "## Updating owners list for #{gem_name}."
  OWNERS.each do |owner|
    value = `gem owner --add #{owner} #{gem_name}`
    puts value
  end
end
