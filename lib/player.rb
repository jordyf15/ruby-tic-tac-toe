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