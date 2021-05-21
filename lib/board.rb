# old_data = [1, 2, 3, 4, 5, 6, 7]
# [8, 9, 10, 11, 12, 13, 14]
# [15, 16, 17, 18, 19, 20, 21]
# [22, 23, 24, 25, 26, 27, 28]
# [29, 30, 31, 32, 34, 35, 36]
# [37, 38, 39, 40, 41, 42, 43]
class Board
  attr_reader :board
  def initialize
    @board = [
      ['.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.']
    ]
  end

  def show
    puts <<-HEREDOC
      #{board[0]}
      #{board[1]}
      #{board[2]}
      #{board[3]}
      #{board[4]}
      #{board[5]}
    HEREDOC
  end

  def row(layer)
    row = board.length
    row - layer
  end

  def column(num)
    num - 1
  end

  def position(num, choice, layer = 1)
    if layer > 6
      puts 'This column is full'
      return
    end

    if @board[row(layer)][column(num)] != '.'
      position(num, choice,  layer + 1)
    else
      @board[row(layer)][column(num)] = choice
    end
  end
end

board = Board.new
board.position(7, 'x')
board.position(7, 'x')
board.show
