class PublicCell
  def discovered?
    false
  end
end

class PrivateCell

  def initialize(x, y)
    @x = x
    @y = y
  end

  def public_cell
    PublicCell.new
  end

  def to_s
    "Private cell (#{@x}, #{@y})"
  end
end


class Minesweeper

  def initialize(width, height, mines_number)
    @width = width
    @height = height
    @mines_number = mines_number

    @lines = Array.new(@height) { |column| Array.new(@width) { |line| PrivateCell.new(column, line) } }

  end

  def to_s
    "Minefield game: size=#{@width}x#{@height}, number of mines=#{@mines_number}"
  end

  def play
    true
  end

  def still_playing?
    true
  end

  def board_state
    Array.new(@height) do |column|
      Array.new(@width) do |line|
        puts @lines[column][line]
        @lines[column][line].public_cell
      end
    end
  end

end


class Printer

end