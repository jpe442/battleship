require_relative 'board'

class HumanPlayer
    
attr_accessor :board, :display, :name

  def initialize(name)
    @name = name
    @board = Board.new
    @display = Board.new
    @attacks = []
    @placements = []
  end

  def setup
    ships = 3
    until ships == 0
      puts "You have #{ships} ships remaining to place..."
      place_ship
      ships -= 1
      @board.grid.each {|row| p row}
    end

  end 

  def get_placement

    placement = "invalid"
    until valid?(placement) && !@placements.include?(placement)
      puts "Where would you like to place a ship?"
      placement = parse($stdin.gets.chomp)
    end 

    @placements << placement
    placement 

  end

  def parse(input)
    input.split(",").map {|ch| ch.to_i}
  end 
  
  def place_ship

    pos = get_placement
    @board[pos] = :s
  
  end

  def render
    @display.grid.each {|row| p row}
  end

    
  def valid?(input)

    return false if input.length != 2 
    input.each do |digit|
      return false unless (0..9).include?(digit.to_i)
    end
    true
  end


  def get_play
    
    play = "invalid"
    until valid?(play) 
      puts "Which position would you like to fire upon?"
      play = parse($stdin.gets.chomp)
    end

      play
  end

    
end
