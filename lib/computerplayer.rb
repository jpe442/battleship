require_relative 'board'

class ComputerPlayer
    
attr_accessor :board, :attacks, :display, :name
    
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

  def place_ship
    placement = [rand(0..9), rand(0..9)]

    if @placements.include?(placement)
      place_ship
    else
      @placements << placement
      @board[placement] = :s
    end

  end

  def render
    @display.grid.each {|row| p row}
  end
    
  def get_play
    play = [rand(0..9), rand(0..9)]

    if @attacks.include?(play)
      get_play
    else 
      @attacks << play
    p  play
    end
      
  end
    
end
