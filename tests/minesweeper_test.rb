require_relative 'minitest_helper'


class MinesweeperTest < Minitest::Test

  def test_initial_state
    game = Minesweeper.new(2, 4, 1)

    assert_equal("Minefield game: size=2x4, number of mines=1", game.to_s)
    assert(game.still_playing?)

    game.board_state.each do |column|
      column.each do |public_cell|
        assert(!public_cell.discovered?)
      end
    end

  end

  def test_play_on_safe_cell
    game = Minesweeper.new(2, 2, 0)

    assert game.play(0, 0)
    assert game.still_playing?
    assert game.board_state[0][0].discovered?

    # play on cell already discovered is not valid
    assert !game.play(0, 0)
  end

  def test_set_mined_fields_using_shuffle_array
    Minesweeper.stub(:shuffle_array, ->(array) { array.reverse }) do
      [1...10].each do
        game = Minesweeper.new(2, 2, 1)
        assert(game.play(0, 0))
        assert(game.play(0, 1))
        assert(game.play(1, 0))
        assert(!game.play(1, 1))
      end
    end

  end

end
