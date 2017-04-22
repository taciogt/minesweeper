class Printer

  def initialize(game)
    @game = game
  end

  def to_s
    print
  end

  def get_cell_symbol(cell, xray: false)
    if cell.flag?
      'F'
    elsif !cell.discovered?
      '.'
    elsif cell.mine?
      '#'
    elsif cell.surrounding_mines > 0
      cell.surrounding_mines.to_s
    else
      ' '
    end
  end

  def print(xray: false)
    board_state = @game.board_state(xray: xray)

    width = board_state.size
    height = board_state[0].size

    board_string = ''
    height.times do |y|
      line_string = ''
      width.times do |x|
        cell = board_state[x][y]
        line_string += get_cell_symbol(cell)
      end
      line_string += "\r\n"
      board_string += line_string
    end
    board_string


  end

end
