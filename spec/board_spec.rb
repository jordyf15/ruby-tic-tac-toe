require '../lib/board'

describe Board do
  describe "#check_board" do
    context "when player successfully make a horizontal row" do
      subject(:horizontal_win_board) {described_class.new }
      context "In the top row" do
        it "should return true" do
          horizontal_win_board.mark_board_success? ({ grid: 1, marker: 'X' })
          horizontal_win_board.mark_board_success? ({ grid: 2, marker: 'X' })
          horizontal_win_board.mark_board_success? ({ grid: 3, marker: 'X' })
          result = horizontal_win_board.check_board
          expect(result).to eql true
        end
      end
      
      context "In the middle row" do
        it "should return true" do
          horizontal_win_board.mark_board_success? ({ grid: 4, marker: 'X' })
          horizontal_win_board.mark_board_success? ({ grid: 5, marker: 'X' })
          horizontal_win_board.mark_board_success? ({ grid: 6, marker: 'X' })
          result = horizontal_win_board.check_board
          expect(result).to eql true
        end
      end
    
      context "In the bottom row" do
        it "should return true" do
          horizontal_win_board.mark_board_success? ({ grid: 7, marker: 'X' })
          horizontal_win_board.mark_board_success? ({ grid: 8, marker: 'X' })
          horizontal_win_board.mark_board_success? ({ grid: 9, marker: 'X' })
          result = horizontal_win_board.check_board
          expect(result).to eql true
        end
      end
    end

    context "when player successfully make a vertical row" do
      subject(:vertical_win_board) {described_class.new }
      context "In the left row" do
        it "should return true" do
          vertical_win_board.mark_board_success? ({ grid: 1, marker: 'X'})
          vertical_win_board.mark_board_success? ({ grid: 4, marker: 'X'})
          vertical_win_board.mark_board_success? ({ grid: 7, marker: 'X'})
          result = vertical_win_board.check_board
          vertical_win_board.print_board_grid
          expect(result).to eql true
        end
      end

      context "In the middle row" do
        it "should return true" do
          vertical_win_board.mark_board_success? ({ grid: 2, marker: 'X'})
          vertical_win_board.mark_board_success? ({ grid: 5, marker: 'X'})
          vertical_win_board.mark_board_success? ({ grid: 8, marker: 'X'})
          result = vertical_win_board.check_board
          vertical_win_board.print_board_grid
          expect(result).to eql true
        end
      end

      context "In the right row" do
        it "should return true" do
          vertical_win_board.mark_board_success? ({ grid: 3, marker: 'X'})
          vertical_win_board.mark_board_success? ({ grid: 6, marker: 'X'})
          vertical_win_board.mark_board_success? ({ grid: 9, marker: 'X'})
          result = vertical_win_board.check_board
          vertical_win_board.print_board_grid
          expect(result).to eql true
        end
      end
    end

    context "When player successfully make a cross row" do
      subject(:cross_win_board) {described_class.new }
      context "when it is a left cross row" do
        it "should return true" do
          cross_win_board.mark_board_success? ({grid: 3, marker: 'X'})
          cross_win_board.mark_board_success? ({grid: 5, marker: 'X'})
          cross_win_board.mark_board_success? ({grid: 7, marker: 'X'})
          result = cross_win_board.check_board
          expect(result).to eql true
        end
      end

      context "when it is a right cross row" do
        it "should return true" do
          cross_win_board.mark_board_success? ({grid: 1, marker: 'X'})
          cross_win_board.mark_board_success? ({grid: 5, marker: 'X'})
          cross_win_board.mark_board_success? ({grid: 9, marker: 'X'})
          result = cross_win_board.check_board
          expect(result).to eql true
        end
      end
    end
  end

  describe "#mark_board_success?" do
    before do
      @board = described_class.new
      @board.mark_board_success? ({grid: 1, marker: 'X'})
    end
    
    context "the chosen grid is already marked" do
      it "should return false" do
        result = @board.mark_board_success? ({grid: 1, marker: 'X'})
        expect(result).to eql false
      end
    end

    context "the chosen grid is not marked yet" do
      it "should return true" do
        result = @board.mark_board_success? ({grid: 2, marker: 'X'})
        expect(result).to eql true
      end
    end
  end
end