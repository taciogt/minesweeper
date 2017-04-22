require_relative 'src/cells'
require_relative 'src/game'
require_relative 'src/printer'

game = Minesweeper.new 4, 5, 3

# Printer.print game
# puts '----------'
# game.play 0, 0
# Printer.print game
#
# puts '----------'
# game.play 1, 0
# Printer.print game

positions = []
2.times do |x|
  4.times do |y|
    positions.push [x, y]
  end
end
positions.shuffle

game_printer = Printer.new(game)

while game.still_playing?
  next_play = positions.pop
  x = next_play[0]
  y = next_play[1]
  puts "Playing on position: #{x}, #{y}"

  game.play(x, y)
  puts game_printer

  puts '----------------'
end