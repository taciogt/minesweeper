require 'codacy-coverage'

Codacy::Reporter.start

require 'minitest/autorun'
require_relative '../game'
