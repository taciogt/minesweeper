require_relative 'minitest_helper'

class CellTest < Minitest::Test

  def test_constructor
    cell = PublicCell.new(PrivateCell.new(0, 0), 0)
    assert_equal('Public cell (0, 0)', cell.to_s)
  end

end