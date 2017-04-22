require_relative 'minitest_helper'


class PrinterTest < Minitest::Test

  def setup
    @mapped_game = nil
    mapped_mines = [[0, 2], [1, 2], []]
    Minesweeper.stub(:shuffle_array, ->(_array) { mapped_mines }) do
      @mapped_game = Minesweeper.new(3, 4, 2)
    end
    @printer = Printer.new(@mapped_game)
  end

  # Fake test
  def test_print_single_minefield
    game = Minesweeper.new(2, 4, 1)
    assert_equal("..\r\n..\r\n..\r\n..\r\n", Printer.new(game).to_s)
  end

  def test_print_discovered_cell
    @mapped_game.play(0, 0)
    assert_equal("   \r\n...\r\n...\r\n...\r\n", Printer.get_string(@mapped_game.board_state))
  end

  def test_print_discovered_cell
    @mapped_game.play(0, 0)
    assert_equal("   \r\n...\r\n...\r\n...\r\n", @printer.to_s)
  end


end