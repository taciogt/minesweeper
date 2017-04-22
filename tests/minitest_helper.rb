require 'simplecov'
require 'codacy-coverage'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                   SimpleCov::Formatter::HTMLFormatter,
                                                                   Codacy::Formatter
                                                               ])

SimpleCov.start do
  add_filter '/tests/'
end

Codacy::Reporter.start

require 'minitest/autorun'
require_relative '../src/game'
require_relative '../src/printer'
