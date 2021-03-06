require_relative 'cells'

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
    @width.times do |x|
      @height.times do |y|
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
    is_valid = still_playing? && @cells[x][y].hit

    if is_valid && surrounding_mines(@cells[x][y]).zero?
      surrounding_cells(@cells[x][y]).each do |cell|
        play(cell.position.x, cell.position.y) if
            !cell.mine? && surrounding_mines(cell).zero?
      end
    end

    is_valid
  end

  def flag(x, y)
    @cells[x][y].flag
  end

  def still_playing?
    has_lost = false

    @cells.each do |column|
      column.each do |cell|
        has_lost = true if cell.discovered? && cell.mine?
      end
    end

    !has_lost && !victory?
  end

  def victory?
    safe_cells_discovered = 0

    @cells.each do |column|
      column.each do |cell|
        safe_cells_discovered += 1 if cell.discovered? && !cell.mine?
      end
    end

    safe_cells_discovered + @mines_number == @width * @height
  end

  def board_state(xray: false)
    raise SecurityError if xray && still_playing?

    Array.new(@width) do |x|
      Array.new(@height) do |y|
        @cells[x][y].public_cell(surrounding_mines(@cells[x][y]), xray: xray)
      end
    end
  end

  private

  def valid_position?(x, y)
    x >= 0 && x < @width && y >= 0 && y < @height
  end

  def surrounding_cells(cell)
    cells = []

    Array((cell.position.x - 1)..(cell.position.x + 1)).each do |x|
      Array((cell.position.y - 1)..(cell.position.y + 1)).each do |y|
        is_same_cell = x == cell.position.x && y == cell.position.y
        cells.push(@cells[x][y]) if valid_position?(x, y) && !is_same_cell
      end
    end

    cells
  end

  def surrounding_mines(cell)
    surrounding_mines = 0

    surrounding_cells(cell).each do |neighbour_cell|
      surrounding_mines += 1 if neighbour_cell.mine?
    end

    surrounding_mines
  end
end

