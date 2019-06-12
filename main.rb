require './game'
require './interface'
require './player'
require './question'

# Test code

new_game = Game.new({
  player_controller: Player,
  question_controller: Question, 
  interface: Interface
})
new_game.play()

