require_relative 'game'

game = Minesweeper.new 2, 4, 3

Printer.print game
game.play 0, 0
Printer.print game