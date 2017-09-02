require 'spec_helper'
require 'capybara/rspec'

Dir.glob('spec/**/*steps.rb') { |f| load f, true }
