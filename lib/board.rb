class Board
    def initialize
      @board_grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end
  
    attr_reader :board_grid
  
    def print_board_grid
      puts "\n #{@board_grid[0]} | #{@board_grid[1]} | #{@board_grid[2]} \n" \
           "---+---+---\n" \
           " #{@board_grid[3]} | #{@board_grid[4]} | #{@board_grid[5]} \n" \
           "---+---+---\n" \
           " #{@board_grid[6]} | #{@board_grid[7]} | #{@board_grid[8]} \n\n"
    end
  
    def mark_board_success?(player_move)
      if @board_grid[player_move[:grid] - 1].instance_of?(Integer)
        @board_grid[player_move[:grid] - 1] = player_move[:marker]
        true
      else
        false
      end
    end
  
    def check_board
      if check_board_horizontal == true
        true
      elsif check_board_vertical == true
        true
      # cross grid checking
      elsif (@board_grid[0] == @board_grid[4] && @board_grid[4] == @board_grid[8]) ||
            (@board_grid[2] == @board_grid[4] && @board_grid[4] == @board_grid[6])
        true
      elsif check_board_draw
        nil
      else
        false
      end
    end
  
    private
  
    def check_board_draw
      @board_grid.count { |grid| grid.instance_of?(Integer) }.zero?
    end
  
    def check_board_horizontal
      3.times do |counter|
        break true if @board_grid[counter * 3] == @board_grid[(counter * 3) + 1] &&
                      @board_grid[(counter * 3) + 1] == @board_grid[(counter * 3) + 2]
      end
    end
  
    def check_board_vertical
      3.times do |counter|
        break true if @board_grid[counter] == @board_grid[counter + 3] &&
                      @board_grid[counter + 3] == @board_grid[counter + 6]
      end
    end
  end