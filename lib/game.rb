# It’s a basic game where each player takes turns dropping pieces into the cage. Players win if they manage to get 4 of their pieces consecutively in a row, column, or along a diagonal.
require_relative 'board'
require_relative 'player'

class Game 
  attr_accessor :first_player, :second_player, :current_player

  def initilaize 
    @board = Board.new
    @first_player = nil
    @second_player = nil
    @current_player = nil
  end

  def play_game
    combatents
    board.show
    play_game
    result
  end
end