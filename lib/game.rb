require_relative 'board'
require_relative 'player'

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