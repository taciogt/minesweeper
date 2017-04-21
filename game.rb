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
    "Private cell (#{@x}, #{@y})"
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


class Minesweeper

  def initialize(width, height, mines_number)
    @width = width
    @height = height
    @mines_number = mines_number

    @cells = Array.new(@width) do |x|
      Array.new(@height) do |y|
        PrivateCell.new x, y
      end
    end

    mine_positions = []
    Array.new(@width) do |x|
      Array.new(@height) do |y|
        mine_positions.push [x, y]
      end
    end

    mine_positions = Minesweeper.shuffle_array mine_positions
    mine_positions.take(@mines_number).each do |pair|
      @cells[pair[0]][pair[1]].set_mine
    end

  end

  def self.shuffle_array(array)
    array.shuffle
  end

  def to_s
    "Minefield game: size=#{@width}x#{@height}, number of mines=#{@mines_number}"
  end

  def play(x, y)
    @cells[x][y].hit
  end

  def flag(x, y)
    @cells[x][y].flag
  end

  def still_playing?
    still_playing = true

    @cells.each do |column|
      column.each do |cell|
        still_playing = false if cell.discovered? && cell.has_mine?
      end
    end

    still_playing
  end

  def board_state
    Array.new(@width) do |x|
      Array.new(@height) do |y|
        @cells[x][y].public_cell
      end
    end
  end

end


class Printer

  def self.get_string(board_state)
    width = board_state.size
    height = board_state[0].size

    board_string = ''

    Array(0...height).each do |y|
      line_string = ''
      Array(0...width).each do |x|
        cell = board_state[x][y]
        cell.discovered? ? line_string += ' ' : line_string += '.'
      end
      line_string += "\r\n"
      board_string += line_string
    end

    board_string
  end

  def self.print(game)
    board_state_as_string = get_string game.board_state
    puts board_state_as_string
  end

end