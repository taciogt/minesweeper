class Printer

  def initialize(game)
    @game = game
  end

  def to_s
    board_state = @game.board_state
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

end
