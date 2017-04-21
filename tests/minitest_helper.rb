require 'codacy-coverage'

Codacy::Reporter.start do
  add_filter '_test'
end

require 'minitest/autorun'
require_relative '../game'
