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

  def mark_board_success?(grid, marker)
    # if(@board_grid[grid-1].cla)
    @board_grid[grid-1] = marker

  end

  def check_board()
    # horizontal grid checking
    if((@board_grid[0] == @board_grid[1] && @board_grid[1] == @board_grid[2]) || 
    (@board_grid[3] == @board_grid[4] && @board_grid[4] == @board_grid[5]) || 
    (@board_grid[6] == @board_grid[7] && @board_grid[7] == @board_grid[8]))
      true
    # vertical grid checking
    elsif ((@board_grid[0] == @board_grid[3] && @board_grid[3] == @board_grid[6]) ||
    (@board_grid[1] == @board_grid[4] && @board_grid[4] == @board_grid[7]) || 
    (@board_grid[2] == @board_grid[5] && @board_grid[5] == @board_grid[8]))
      true
    # cross grid checking
    elsif ((@board_grid[0] == @board_grid[4] && @board_grid[4] == @board_grid[8]) || 
    (@board_grid[2] == @board_grid[4] && @board_grid[4] == @board_grid[6]))
      true
    else
      false 
    end
  end
end


def input_name(player_number)
  puts "What is the name of player##{player_number}"
  player_name = gets.chomp
  until player_name.size>0
    puts "Please input the player name, it cannot be empty"
    player_name = gets.chomp
  end
  player_name
end

def input_marker(previous_player_marker)
  puts "What 1 letter or character that will be your marker?"
  if previous_player_marker
    puts "It cannot be #{previous_player_marker}"
    player_marker = gets.chomp
    until player_marker.size == 1 && player_marker!=previous_player_marker
      if player_marker.size !=1 
        puts "Please input only 1 character"
      elsif player_marker == previous_player_marker
        puts "It cannot be #{previous_player_marker}"
      end
      player_marker = gets.chomp
    end
  else
    player_marker = gets.chomp
    until player_marker.size == 1
      puts "Please input only 1 character"
      player_marker = gets.chomp
    end
  end
end

def main
  play_again = true
  while play_again == true
    board = Board.new()
    player1_name = input_name(1)
    player1_marker = input_marker(nil)
    player1 = Player.new(player1_name, player1_marker)
    player2_name = input_name(2)
    player2_marker = input_marker(player1_marker)
    player2 = Player.new(player2_name, player2_marker)

    unless board.check_board()
    
    end
  end
end

main()
