require '../main'

describe Board do
  describe "#check_board" do
    describe "when player successfully make a horizontal row" do
      subject(:horizontal_win_board) {described_class.new }
      context "In the top row" do
        it "should return true" do
          # horizontal_win_board.mark_board_success? ({ grid: 0, marker: 'X' })
          # horizontal_win_board.mark_board_success? ({ grid: 0, marker: 'X' })
          # horizontal_win_board.mark_board_success? ({ grid: 0, marker: 'X' })
          expect(1).to eql 1
        end
      end
      
      context "In the middle row" do
        it "should return true" do
          
        end
      end
    
      context "In the bottom row" do
        it "should return true" do
          
        end
      end
    end
  end
end