require_relative 'src/cells'
require_relative 'src/game'
require_relative 'src/printer'

game = Minesweeper.new(3, 4, 2)
game_printer = Printer.new(game)

random_plays = []
2.times do |x|
  4.times do |y|
    random_plays.push [x, y]
  end
end
random_plays.shuffle
puts "Plays sequence: #{random_plays}"

while game.still_playing?
  next_play = random_plays.pop
  x = next_play[0]
  y = next_play[1]
  puts "Playing on position: #{x}, #{y}"

  game.play(x, y)
  puts game_printer

  puts '----------------'
end

if game.victory?
  puts 'You won! \o/'
else
  puts 'You lost! =('
end

puts game_printer.print(xray: true)