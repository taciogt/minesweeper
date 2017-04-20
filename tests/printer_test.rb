require_relative '../game'
require 'minitest/autorun'
require 'codacy-coverage'

# require 'test/unit'

Codacy::Reporter.start

class PrinterTest < Minitest::Test

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
  def test_print_single_minefield
    game = Minesweeper.new(2, 4, 1)
    printer = Printer.new
    assert_equal("..\r\n..\r\n..\r\n..\r\n", printer.get_string(game.board_state))

  end


end