require_relative 'game'
require 'minitest/autorun'
require 'codacy-coverage'

# require 'test/unit'

Codacy::Reporter.start

class MyTest < Minitest::Test

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def test_constructor
    width, height, mines_number = 10, 20, 50

    game = Minesweeper.new(width, height, mines_number)
    puts game
    assert_equal("Minefield game: size=10x20, number of mines=50", game.to_s)
  end
end