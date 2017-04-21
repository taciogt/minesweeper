class PublicCell
  def initialize(discovered)
    @discovered = discovered
  end

  def discovered?
    @discovered
  end
end


class PrivateCell

  def initialize(x, y)
    @x = x
    @y = y
    @discovered = false
    @has_mine = false
  end

  def public_cell
    PublicCell.new(@discovered)
  end

  def hit
    @discovered = true
    !@has_mine
  end

  def to_s
    "Private cell (#{@x}, #{@y})"
  end

  def set_mine
    @has_mine = true
  end
end


class Minesweeper

  def initialize(width, height, mines_number)
    @width = width
    @height = height
    @mines_number = mines_number


    @lines = Array.new(@height) do |column|
      Array.new(@width) do |line|
        PrivateCell.new column, line
      end
    end

    mine_positions = []
    Array.new(@height) do |column|
      Array.new(@width) do |line|
        mine_positions.push [column, line]
      end
    end

    mine_positions = Minesweeper.shuffle_array mine_positions
    mine_positions.take(@mines_number).each do |pair|
      @lines[pair[0]][pair[1]].set_mine
    end

  end

  def self.shuffle_array(array)
    array.shuffle
  end

  def to_s
    "Minefield game: size=#{@width}x#{@height}, number of mines=#{@mines_number}"
  end

  def play(x, y)
    @lines[y][x].hit
  end

  def still_playing?
    true
  end

  def board_state
    Array.new(@height) do |column|
      Array.new(@width) do |line|
        @lines[column][line].public_cell
      end
    end
  end

end


class Printer

  def self.get_string(board_state)
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

  def self.print(game)
    board_state_as_string = get_string game.board_state
    puts board_state_as_string
  end

end