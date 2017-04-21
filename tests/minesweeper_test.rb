require_relative 'minitest_helper'


class MinesweeperTest < Minitest::Test

  def setup
    @clear_game = Minesweeper.new(2, 3, 0)
    @all_mined_game = Minesweeper.new(2, 3, 6)
  end

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

  def test_play
    assert @clear_game.play(0, 0)
    assert @clear_game.still_playing?
    assert @clear_game.board_state[0][0].discovered?

    # play on cell already discovered is not valid
    assert !@clear_game.play(0, 0)

    # play on cell with a flag is not valid
    assert @clear_game.flag(1, 0)
    assert !@clear_game.play(1, 0)
  end

  def test_flag
    # can flag undiscovered cell
    assert @clear_game.flag(0, 0)

    # cannot flag discovered cell
    @clear_game.play(1, 0)
    assert !@clear_game.flag(1, 0)
  end

  def test_still_playing
    # when game starts, always can play
    assert @clear_game.still_playing?
    assert @all_mined_game.still_playing?

    # stops playing when hit on mine
    @all_mined_game.play(0, 0)
    assert !@all_mined_game.still_playing?
  end

  def test_set_mines_using_shuffled_array
    Minesweeper.stub(:shuffle_array, ->(array) { array.reverse }) do
      [1...10].each do
        game = Minesweeper.new(2, 2, 1)
        assert(game.play(0, 0))
        assert(game.play(0, 1))
        assert(game.play(1, 0))
        assert(game.still_playing?)
        assert(game.play(1, 1))
        assert(!game.still_playing?)
      end
    end

  end

end
