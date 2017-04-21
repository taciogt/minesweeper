require_relative '../game'
require 'minitest/autorun'


class PrinterTest < Minitest::Test

  # Fake test
  def test_print_single_minefield
    game = Minesweeper.new(2, 4, 1)
    assert_equal("..\r\n..\r\n..\r\n..\r\n", Printer.get_string(game.board_state))

  end


end