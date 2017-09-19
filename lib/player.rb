require_relative 'board'
require_relative 'ship'

class HumanPlayer
    
attr_accessor :board, :display, :name, :placements

  def initialize(name)
    @name = name
    @board = Board.new
    @display = Board.new
    @ships = Ships.new
    @attacks = []
    @placements = []
  end

  def setup
    place_ships
    until gets
    end
  end 

  def get_placement(type, ship)
    system('clear')
    show
    placement = "invalid"
    direction = "wrong"
    until valid?(placement) && @ships.valid_direction?(placement, direction, ship, @board)
      puts "Where would you like to place the #{type}?"
      placement = parse($stdin.gets.chomp)
      puts "Which direction? (up,down,left,or right)"
      direction = $stdin.gets.chomp
    end 

    @placements << placement
    @ships.place_ship(placement, direction, ship, @board) 
  end
    
  def render
    display.grid.each {|row| p row}
  end
  
  def show
    board.grid.each {|row| p row}
  end
  
    
  def parse(input)
    input.split(",").map {|ch| ch.to_i}
  end 
  
  def place_ships
    @ships.ships.each do |type, pieces|
      until pieces.length == 0
        get_placement(type, pieces.pop)
      end
    end
    system('clear')
    puts "This is your board..."
    puts "Press enter to continue..."
    show
    until gets
    end
    system('clear')
    puts "All ships have been placed..."
  end
    
  def valid?(input)
    return false if input.length != 2
    input.each {|digit| return false unless (0..9).include?(digit.to_i)}
    true
  end

  def get_play
    play = "invalid"
    until valid?(play) 
      puts "Which position would you like to fire upon?"
      puts "(0,0 is the most top-left place / 9,0 is the most bottom-right place)"
      play = parse($stdin.gets.chomp)
    end

      play
  end

end

