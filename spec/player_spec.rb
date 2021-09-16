require '../lib/player'

describe Player do
  describe "#place_mark" do
    subject(:player) {described_class.new 'jordy', 'J'}
    context "when player immediately give valid input" do
      before do
        allow(player).to receive(:gets).and_return '1'
      end
      it "return hash with grid and marker" do
        result = player.place_mark
        expect(result).to eql({grid: 1, marker: player.marker})
      end

      it "doesn't puts error message" do
        expect(player).not_to receive(:puts).with('Please input between 1-9')
        player.place_mark
      end
    end

    context "When player give invalid input" do
      before do
        allow(player).to receive(:gets).and_return('a', '0', '1')
      end
      it 'puts error message until player give valid input' do
        expect(player).to receive(:puts).with("Please input between 1-9").exactly(2).times
        player.place_mark
        player.place_mark
        player.place_mark
      end
    end
  end
end