class Board

attr_accessor :grid
    
  def self.default_grid
    Array.new(10) { Array.new(10) }
  end

  def initialize(grid=Board.default_grid)
    @grid = grid
  end
  
  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end
    
  def place_random_ship
    # when the board is empty, places a ship in a random position
    # when the board is empty places a ship until full
    if !self.full?
      row = rand(0..@grid.length-1)
      col = rand(0..@grid.length-1)
      pos = [row, col]
      self[pos] = :s if empty?(pos)
    elsif self.full?
      raise "stop placing ships"
    end 
        
  end
  
  def display
    @grid.each { |row| p row }
  end
  
  def count
    # returns the number of ships on the board
    @grid.flatten.count(:s)
  end

  def empty?(pos=nil)
    # when passed a position with ships on the board returns false
    # when not passed a position with ships on the board returns false
    # when passed a position with no ships on the board returns true
    if pos == nil
      if self.count == 0
        return true
      else 
        return false
      end
    else
      return false if self[pos] != nil
      return true if self[pos] == nil
    end
  end
    
  def full?
    # when the board is full returns true
    # when theboard is not full returns false
    @grid.flatten.all? { |el| el == :s }
  end

  def won?
  # when no ships remain returns true
  # when at least one ship remains returns false
    self.count < 1
  end
    
end
