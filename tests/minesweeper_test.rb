require_relative 'minitest_helper'


class MinesweeperTest < Minitest::Test

  def setup
    @clear_game = Minesweeper.new(2, 3, 0)
    @all_mined_game = Minesweeper.new(2, 3, 6)

    @mapped_game = nil
    mapped_mines = [[0, 2], [1, 2]]
    Minesweeper.stub(:shuffle_array, ->(array) { mapped_mines }) do
      @mapped_game = Minesweeper.new(3, 4, 2)
    end

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

  def test_private_methods_are_private
    assert_raises NoMethodError do
      @clear_game.surrounding_cells(PrivateCell.new(0, 0))
    end

    assert_raises NoMethodError do
      @clear_game.surrounding_mines(PrivateCell.new(0, 0))
    end
  end

  def test_play
    assert @clear_game.play(0, 0)
    assert @clear_game.still_playing?
    assert @clear_game.board_state[0][0].discovered?

    # play on cell already discovered is not valid
    assert !@clear_game.play(0, 0)
  end

  def test_play_on_flag
    # play on cell with a flag is not valid
    assert @clear_game.flag(0, 0)
    assert !@clear_game.play(0, 0)

    # if flag is removed can play again
    assert @clear_game.flag(0, 0)
    assert @clear_game.play(0, 0)
  end

  def test_play_show_surrounding_mines
    game = nil
    mapped_mines = [[1, 0]]
    Minesweeper.stub(:shuffle_array, ->(_array) { mapped_mines }) do
      game = Minesweeper.new(2, 2, 1)
    end

    assert game.play(0, 1)
    assert game.still_playing?

    board_state = game.board_state
    assert(!board_state[0][0].discovered?)
    assert(board_state[0][1].discovered?)
    assert(!board_state[1][0].discovered?)
    assert(!board_state[1][0].discovered?)

    assert_equal(0, board_state[0][0].surrounding_mines)
    assert_equal(1, board_state[0][1].surrounding_mines)
    assert_equal(0, board_state[1][0].surrounding_mines)
    assert_equal(0, board_state[1][0].surrounding_mines)
  end

  def test_play_hit_cell_discovers_more
    game = nil
    mapped_mines = [[0, 2]]
    Minesweeper.stub(:shuffle_array, ->(_array) { mapped_mines }) do
      game = Minesweeper.new(3, 3, 1)
    end

    assert game.play(0, 0)
    assert game.still_playing?

    board_state = game.board_state
    assert(board_state[0][0].discovered?)
    assert(!board_state[0][1].discovered?)
    assert(!board_state[0][2].discovered?)
    assert(board_state[1][0].discovered?)
    assert(!board_state[1][1].discovered?)
    assert(!board_state[1][2].discovered?)
    assert(board_state[2][0].discovered?)
    assert(board_state[2][1].discovered?)
    assert(board_state[2][2].discovered?)

    Array(0...3).each do |x|
      Array(0...3).each do |y|
        assert_equal 0, board_state[x][y].surrounding_mines
      end
    end
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
    assert(@clear_game.still_playing?)
    assert(@all_mined_game.still_playing?)

    # stops playing when hit on mine
    @all_mined_game.play(0, 0)
    assert(!@all_mined_game.still_playing?)
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
