require_relative '../game'
require 'minitest/autorun'


class MinesweeperTest < Minitest::Test

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
    game = Minesweeper.new(2, 4, 1)

    assert_equal("Minefield game: size=2x4, number of mines=1", game.to_s)
    assert(game.still_playing?)

    game.board_state.each do |column|
      column.each do |public_cell|
        assert(!public_cell.discovered?)
      end
    end

  end

  def test_stub_works
    game = Minesweeper.new(2, 2, 0)

    game.stub(:random_number, 42.42) do
      assert_equal(42.42, game.random_number)
    end

  end

end
