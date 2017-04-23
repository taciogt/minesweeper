# Minesweeper

[![Build Status](https://travis-ci.org/taciogt/minesweeper.svg?branch=master)](https://travis-ci.org/taciogt/minesweeper)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/72a68158e7354f7f88d2298135e89518)](https://www.codacy.com/app/taciogt/minesweeper?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=taciogt/minesweeper&amp;utm_campaign=Badge_Grade)
[![Codacy Badge](https://api.codacy.com/project/badge/Coverage/72a68158e7354f7f88d2298135e89518)](https://www.codacy.com/app/taciogt/minesweeper?utm_source=github.com&utm_medium=referral&utm_content=taciogt/minesweeper&utm_campaign=Badge_Coverage)

Minesweeper game engine implemented in Ruby 2.x using OOP, TDD, CI and other cool techniques.

## Introduction

This is my first Ruby project and its main purpose is to learn the language syntax, some of its best practices and how to apply CI techniques in this new environment.

The engine was implemented using TDD with [TracisCI](https://travis-ci.org/taciogt/minesweeper) do run all tests suites at every commit pushed to this remote. 

To evaluate the tests coverage level and some aspects of code quality, this project uses [Codacy](https://www.codacy.com/app/taciogt/minesweeper?utm_source=github.com&utm_medium=referral&utm_content=taciogt/minesweeper&utm_campaign=Badge_Coverage) to make code analysis and track the coverage level of each file. The coverage report is sent by TravisCI at each successful build.   

## Demonstration
 
To show how this engine works, there's the file [example.rb](https://github.com/taciogt/minesweeper/blob/master/example.rb). You can run it using Ruby version 2.x to see a minefield with size 3x4 played randomly.

