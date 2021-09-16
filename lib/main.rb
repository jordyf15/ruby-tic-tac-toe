require_relative 'game'

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