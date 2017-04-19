class Minesweeper
  def initialize(width, height, mines_number)
    @width = width
    @height = height
    @mines_number = mines_number
  end

  def to_s
    "Minefield game: size=#{@width}x#{@height}, number of mines=#{@mines_number}"
  end
end