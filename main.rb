# frozen_string_literal: true

class Player
  # player class
  attr_reader :marker, :name

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def place_mark
    grid = -1
    until grid >= 1 && grid <= 9
      grid = gets.chomp.to_i
      puts 'Please input between 1-9' unless grid >= 1 && grid <= 9
    end
    { grid: grid, marker: marker }
  end
end

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

class Game
  def initialize
    @board = Board.new
    @players = []
    @player_turn = 1
  end

  def create_player
    player_name = input_player_name(@players.size + 1)
    player_marker = input_player_marker(@players.size.zero? ? nil : @players[0].marker)
    player = Player.new(player_name, player_marker)
    @players.push(player)
  end

  def play_game
    loop do
      @board.print_board_grid
      loop do
        puts "#{@players[@player_turn - 1].name}, please enter a number(1-9) that is available to put '#{@players[@player_turn - 1].marker}"
        break if @board.mark_board_success?(@players[@player_turn - 1].place_mark)
      end
      @player_turn = @player_turn == 1 ? 2 : 1
      break if @board.check_board == true || @board.check_board.nil?
    end
  end

  def conclude_game
    @board.print_board_grid
    if @board.check_board.nil?
      puts 'Draw'
    elsif @player_turn == 2
      puts "Player 1 #{@players[0].name} Wins!"
    else
      puts "Player 2 #{@players[1].name} Wins!"
    end
  end

  private

  def input_player_name(player_number)
    puts "What is the name of player##{player_number}"
    player_name = gets.chomp
    until player_name.size.positive?
      puts 'Please input the player name, it cannot be empty'
      player_name = gets.chomp
    end
    player_name
  end

  def input_player_marker(previous_player_marker)
    puts 'What 1 letter or character that will be your marker?'
    if previous_player_marker
      puts "It cannot be #{previous_player_marker}"
      player_marker = gets.chomp
      until player_marker.size == 1 && player_marker != previous_player_marker
        if player_marker.size != 1
          puts 'Please input only 1 character'
        elsif player_marker == previous_player_marker
          puts "It cannot be #{previous_player_marker}"
        end
        player_marker = gets.chomp
      end
    else
      player_marker = gets.chomp
      until player_marker.size == 1
        puts 'Please input only 1 character'
        player_marker = gets.chomp
      end
    end
    player_marker
  end
end

def main
  puts "Welcome to jordy's Tic-tac-toe!!"
  play_again = true
  while play_again == true
    game = Game.new
    game.create_player
    game.create_player
    game.play_game
    game.conclude_game

    puts "Do you want to play again? Input 'y' for yes and 'n'for no."
    play_again_input = gets.chomp
    until %w[y n].include?(play_again_input)
      puts "Please input 'y' for yes and 'n'for no."
      play_again_input = gets.chomp
    end
    play_again = false if play_again_input == 'n'
  end
  puts 'Thank you for playing and have a nice day.'
end

main
