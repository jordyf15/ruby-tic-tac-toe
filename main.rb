class Player
  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def place_mark()
    grid = -1
    until (grid >= 1 && grid <= 9)
      grid = gets.chomp.to_i
      unless grid >= 1 && grid <= 9
        puts "Please input between 1-9"
      end
    end
  end
end

class Board
  def initialize()
    @board_grid = [1,2,3,4,5,6,7,8,9]
  end

  def board_grid()
    @board_grid
  end

  def print_board_grid()
    puts "\n #{@board_grid[0]} | #{@board_grid[1]} | #{@board_grid[2]} \n"+
    "---+---+---\n"+
    " #{@board_grid[3]} | #{@board_grid[4]} | #{@board_grid[5]} \n"+
    "---+---+---\n"+
    " #{@board_grid[6]} | #{@board_grid[7]} | #{@board_grid[8]} \n\n"
  end

  def mark_board(grid, marker)
    @board_grid[grid-1] = marker
  end
end

