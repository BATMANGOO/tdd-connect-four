require_relative '../lib/board'

describe Board do
  let(:board_table) { described_class.new }
  describe '#position' do
    it 'should return the given position' do
      board = board_table.instance_variable_get(:@board)
      board_position = board_table.board[board.length - 1][6]
      expect(board_position).to eq('x')
      board_table.position(7, 'x')
    end
  end
end