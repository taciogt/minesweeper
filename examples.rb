require_relative 'game'

game = Minesweeper.new 2, 4, 3

Printer.print game
puts '----------'
game.play 0, 0
Printer.print game

puts '----------'
game.play 1, 0
Printer.print game
