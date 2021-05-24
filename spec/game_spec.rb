require_relative '../lib/game'
require_relative '../lib/player'
describe Game do
  describe '#combatents' do
    context 'when initialized' do
      let(:game) { described_class.new }

      before do
        player_name = 'john'
        choice = 'x'
        allow(game).to receive(:puts)
        allow(game).to receive(:create_player).with(1)
        allow(game).to receive(:gets).and_return(player_name)
        allow(game).to receive(:choice_input).and_return(choice)
        allow(Player).to receive(:new).and_return(player_name, choice)
      end

      it 'creates first player' do
        game.create_player(1)
      end
    end
  end
end