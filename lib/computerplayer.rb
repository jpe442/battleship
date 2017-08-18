require_relative 'board'
require_relative 'ship'

class ComputerPlayer
    
attr_accessor :board, :attacks, :display, :name, :ships
    
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
  end

  def place_ships
    @ships.ships.each do |type, pieces|
      until pieces.length == 0
        get_placement(type, pieces.pop)
      end
    end
  end
    
  def get_placement(type, ship)
    directions = ["up", "down", "left", "right"]
    placement = [rand(0..9), rand(0..9)]
    direction = directions[rand(0..3)]
      
    if @placements.include?(placement) || !@ships.valid_direction?(placement, direction, ship, @board)
      get_placement(type, ship)
    else
      @placements << placement
      @ships.place_ship(placement, direction, ship, @board) 
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
