# Generated by cucumber-sinatra. (2014-02-22 11:44:24 +0000)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'lib/sunspot_analyser.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = sunspot_analyser_app

class sunspot_analyser_appWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  sunspot_analyser_appWorld.new
end