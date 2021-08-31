class Player
  attr_reader :marker, :name
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
    {grid: grid, marker: marker}
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

  def mark_board_success?(player_move)
    if(@board_grid[player_move[:grid]-1].class == Integer)
      @board_grid[player_move[:grid]-1] = player_move[:marker]
      true
    else
      false
    end
  end

  def check_board()
    if (check_board_horizontal == true)
      true
    elsif (check_board_vertical == true)
      true
    # cross grid checking
    elsif ((@board_grid[0] == @board_grid[4] && @board_grid[4] == @board_grid[8]) || 
    (@board_grid[2] == @board_grid[4] && @board_grid[4] == @board_grid[6]))
      true
    elsif (check_board_draw())
      nil
    else
      false 
    end
  end

  private
  def check_board_draw()
    @board_grid.count {|grid| grid.class == Integer} == 0?true : false
  end

  def check_board_horizontal()
    3.times do |counter|
      break true if @board_grid[counter*3] == @board_grid[(counter*3)+1] && 
      @board_grid[(counter*3)+1] == @board_grid[(counter*3)+2] 
    end
  end

  def check_board_vertical()
    3.times do |counter|
      break true if @board_grid[counter] == @board_grid[counter+3] &&
      @board_grid[counter+3] == @board_grid[counter+6]
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
    player_marker
  else
    player_marker = gets.chomp
    until player_marker.size == 1
      puts "Please input only 1 character"
      player_marker = gets.chomp
    end
    player_marker
  end
end
# class Game later?
def main
  play_again = true
  while play_again == true
    board = Board.new
    player1_name = input_name(1)
    player1_marker = input_marker(nil)
    player1 = Player.new(player1_name, player1_marker)
    player2_name = input_name(2)
    player2_marker = input_marker(player1_marker)
    player2 = Player.new(player2_name, player2_marker)
    player_turn = 1

    game_finish = board.check_board
    loop do
      board.print_board_grid
      if player_turn == 1
        loop do
          puts "#{player1.name}, please enter a number (1-9) that is available to put '#{player1.marker}'"
          mark_success = board.mark_board_success?(player1.place_mark)
          break if mark_success
        end
        game_finish = board.check_board
        player_turn = 2
      else
        loop do
          puts "#{player2.name}, please enter a number (1-9) that is available to put '#{player2.marker}'"
          mark_success = board.mark_board_success?(player2.place_mark)
          break if mark_success
        end
        game_finish = board.check_board
        player_turn = 1
      end  
      break if board.check_board==true || board.check_board == nil
    end
    board.print_board_grid
    if board.check_board == nil
      puts "Draw"
    elsif player_turn == 2
      puts "PLAYER 1 #{player1.name} WINS"
    else
      puts "PLAYER 2 #{player2.name} WINS"
    end

    puts "Do you want to play again? Input 'y' for yes and 'n'for no."
    play_again_input = gets.chomp
    until play_again_input == 'y' || play_again_input == 'n'
      puts "Please input 'y' for yes and 'n'for no."
      play_again_input = gets.chomp
    end
    play_again = false if play_again_input == 'n'
  end
  puts "Thank you for playing and have a nice day."
end

main()

