require_relative 'src/cells'
require_relative 'src/game'
require_relative 'src/printer'

game = Minesweeper.new 2, 4, 3

Printer.print game
puts '----------'
game.play 0, 0
Printer.print game

puts '----------'
game.play 1, 0
Printer.print game


Array(0...1) do |x|
  puts "#{x}"
  Array(-1..1) do |y|
    puts "#{x}, #{y}"
  end
end