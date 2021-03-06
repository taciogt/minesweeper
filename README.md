# Minesweeper

[![Build Status](https://travis-ci.org/taciogt/minesweeper.svg?branch=master)](https://travis-ci.org/taciogt/minesweeper)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/72a68158e7354f7f88d2298135e89518)](https://www.codacy.com/app/taciogt/minesweeper?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=taciogt/minesweeper&amp;utm_campaign=Badge_Grade)
[![Codacy Badge](https://api.codacy.com/project/badge/Coverage/72a68158e7354f7f88d2298135e89518)](https://www.codacy.com/app/taciogt/minesweeper?utm_source=github.com&utm_medium=referral&utm_content=taciogt/minesweeper&utm_campaign=Badge_Coverage)

Minesweeper game engine implemented in Ruby 2.x using OOP, TDD, CI and other cool techniques.

## Introduction

This is my first Ruby project and its main purpose is to learn the language syntax, some of its best practices and how to apply CI techniques in this new environment.

The engine was implemented using TDD with [TracisCI](https://travis-ci.org/taciogt/minesweeper) do run all test suites at every commit pushed to this remote. 

To evaluate the tests coverage level and some aspects of code quality, this project uses [Codacy](https://www.codacy.com/app/taciogt/minesweeper?utm_source=github.com&utm_medium=referral&utm_content=taciogt/minesweeper&utm_campaign=Badge_Coverage) to make code analysis and track the coverage level of each file. The coverage report is sent to Codacy by TravisCI at each successful build.

## Engine interface

The game engine exposes a simple interface that allows the player to interact with the game while protects the mines positions information while the game isn' finished. 

* Game creation

The game object is created using the Minesweeper class constructor:
```ruby
game = Minesweeper.new(width, heigth, mines_number)
```
 
* Clicking on minefield cells

```ruby
game.play(x, y)
```

Receives the x and y coordinates and clicks at the corresponding cell, then the cell becomes discovered. The method returns a boolean if it was a valid play. The play is valid if the cell isn't clicked and if it hasn't a flag. If the movement is valid and there is no mine in this cell and its neighbours, all its neighbours without bomb or flag become discovered and the same behaviour are applied to them.   

* Flagging a cell

```ruby
game.flag(x, y)
```

Puts a flag in a cell that wasn't clicked or remove the flag from it. Returns a boolean if the movement was valid.

* Check if game is finished

```ruby
game.still_playing?
```

Returns `true` if the game is not finished.
Returns `false` if the player clicked on a mine or all cells without mines are discovered.

* Check if player won

```ruby
game.victory?
```

Return true if all cells without mines were discovered.

* Board State

```ruby
game.board_state(xray: false)
```

Returns a representation of the minefield in the form of a two-dimensional array of `PublicCell`. For each cell in the field (`PrivateCell`) is created a corresponding `PublicCell` that contains only the information already discovered by the player. The user don't have access to all minefield cells information.

Passing the parameter `xray=true` when the game is finished returns a different board state. In this scenario, all cells become discovered, so the player can see all mines positions. Passing the parameter `xray=true` before the game is finished is not allowed and raises a `SecurityError`.
 

## Demonstration
 
To show how this engine works, there's the file [example.rb](https://github.com/taciogt/minesweeper/blob/master/example.rb). You can run it using Ruby version 2.x to see a minefield with size 3x4 played randomly.

