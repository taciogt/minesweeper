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
  def initialize(position, discovered, surrounding_mines)
    @position = position
    @discovered = discovered
    @surrounding_mines = surrounding_mines
  end

  def discovered?
    @discovered
  end

  def surrounding_mines
    @surrounding_mines
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

  def public_cell(surrounding_mines)
    surrounding_mines = 0 unless @discovered
    PublicCell.new(@position, @discovered, surrounding_mines)
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

  def has_mine?
    @has_mine
  end

  def set_mine
    @has_mine = true
  end
end