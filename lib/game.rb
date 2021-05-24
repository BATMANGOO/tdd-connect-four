# It’s a basic game where each player takes turns dropping pieces into the cage. Players win if they manage to get 4 of their pieces consecutively in a row, column, or along a diagonal.
require_relative 'board'
require_relative 'player'

class Game
  attr_accessor :first_player, :second_player, :current_player

  def initialize(board = Board.new)
    @board = board
    @first_player = nil
    @second_player = nil
    @current_player = nil
  end

  def create_game
    combatents
    @board.show
    play_turns
    result
  end

  def create_player(number, duplicate_choice = nil)
    puts "Player ##{number}, what is your name?"
    name = gets.chomp.upcase
    choice = choice_input(duplicate_choice)
    Player.new(name, choice.downcase)
  end

  def turn(number)
    choice = valid_input(number)
    @board.position(choice, current_player.choice)
    @board.show
  end

  def play_turns
    @current_player = first_player
    until @board.full?
      puts "#{current_player.name} please pick a position on the board!"
      position = gets.chomp.to_i
      turn(position)
      # break if board.game_over?

      @current_player = switch_players
    end
  end

  def combatents
    @first_player = create_player(1)
    @second_player = create_player(2, first_player.choice)
  end

  private

  def choice_input(duplicate_choice)
    puts 'and your weapon of choice?'
    input = gets.chomp.downcase
    while input == duplicate_choice
      puts 'That weapon is taken, please choose another.'
      input = gets.chomp.downcase
    end
    input
  end

  def valid_input(number) #work on this
    input = number
    unless input =~ /[1-7]/
      puts 'Please pick a number ranging from 1-7'
      input = gets.chomp
      valid_input(input)
    end 
    input
  end

  def switch_players
    if current_player == first_player
      @current_player = second_player
    else
      @current_player = first_player
    end
  end

  def result
    if @board.game_over?
      puts "Yay #{current_player.name} has come out victorious!"
    else
      puts 'Tie game!'
    end
    play_again?
  end

  def play_again?
    puts 'Would you like to play again? y or n?'
    input = gets.chomp.downcase
    if input == 'y'
      @board = Board.new
      create_game
    else
      puts 'Thanks for playing!'
    end
  end
end

game = Game.new
game.create_game
