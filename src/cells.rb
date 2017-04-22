class Position
  def initialize(x, y)
    @x = x
    @y = y
  end

  def x
    @x
  end

  def y
    @y
  end
end

class PublicCell
  def initialize(private_cell, surrounding_mines, options = {})
    @position = private_cell.position
    @discovered = private_cell.discovered?
    @surrounding_mines = surrounding_mines
    @has_mine = (private_cell.discovered? || options[:xray]) && private_cell.mine?
    @flag = private_cell.flag?
  end

  def discovered?
    @discovered
  end

  def surrounding_mines
    @surrounding_mines
  end

  def mine?
    @has_mine
  end

  def flag?
    @flag
  end

  def to_s
    "Public cell (#{@position.x}, #{@position.y})"
  end

end


class PrivateCell

  def initialize(x, y)
    @position = Position.new(x, y)

    @discovered = false
    @has_mine = false
    @flag = false
  end

  def public_cell(surrounding_mines, options = {})
    surrounding_mines = 0 unless @discovered
    PublicCell.new(self, surrounding_mines, xray: options[:xray])
  end

  def position
    @position
  end

  def hit
    if !@discovered && !@flag
      @discovered = true
      true
    else
      false
    end
  end

  def flag
    if !@discovered
      @flag = !@flag
      true
    else
      false
    end
  end

  def to_s
    "Private cell (#{@position.x}, #{@position.y})"
  end

  def discovered?
    @discovered
  end

  def mine?
    @has_mine
  end

  def flag?
    @flag
  end

  def set_mine
    @has_mine = true
  end
end