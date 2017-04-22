class Printer

  def initialize(game)
    @game = game
  end

  def to_s
    board_state = @game.board_state
    width = board_state.size
    height = board_state[0].size

    board_string = ''

    height.times do |y|
      line_string = ''
      width.times do |x|
        cell = board_state[x][y]
        if cell.flag?
          line_string += 'F'
        elsif !cell.discovered?
          line_string += '.'
        elsif cell.mine?
          line_string += '#'
        elsif cell.surrounding_mines > 0
          line_string += "#{cell.surrounding_mines}"
        else
          line_string += ' '
        end
      end
      line_string += "\r\n"
      board_string += line_string
    end

    board_string
  end

  def print(options = {})

    if options[:xray]
      raise Exception if @game.still_playing?

      board_state = @game.board_state(xray: true)
      width = board_state.size
      height = board_state[0].size

      board_string = ''

      height.times do |y|
        line_string = ''
        width.times do |x|
          cell = board_state[x][y]
          if cell.mine?
            line_string += '#'
          else
            line_string += ' '
          end
        end
        line_string += "\r\n"
        board_string += line_string
      end
      board_string
    else
      to_s
    end


  end

end
