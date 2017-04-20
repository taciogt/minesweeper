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

  def play(x,y)
    true
  end

  def still_playing?
    true
  end

  def board_state
    Array.new(@height) do |column|
      Array.new(@width) do |line|
        # puts @lines[column][line]
        @lines[column][line].public_cell
      end
    end
  end

  def random_number
    rand(1...1000)
  end

end


class Printer

  def get_string(board_state)
    puts board_state
    lines = ''
    board_state.each do |line|
      line_string = ''
      line.each do |cell|
        cell.discovered? ? line_string += ' ' : line_string += '.'

      end
      line_string += "\r\n"
      lines += line_string
    end

    lines
  end
end