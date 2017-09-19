# A new feature that allows us to place different sizes of ships

class Ships

attr_accessor :ships

  def initialize
    @ships = {
    aircraft_carrier: [[:A,:A,:A,:A,:A]],
    battle_ship: [[:B,:B,:B,:B],[:B,:B,:B,:B]],
    submarine: [[:S,:S,:S], [:S,:S,:S], [:S,:S,:S]],
    destroyer: [[:D,:D,:D],[:D,:D,:D],[:D,:D,:D]],
    patrol_boat: [[:P,:P],[:P,:P],[:P,:P],[:P,:P],[:P,:P]]
    }
  end
    
  def place_ship(placement, direction, ship, board)
    case direction
    when "up"
      edge = placement[0] - (ship.length-1)
      area = (edge..placement[0]).map {|row| [row, placement[1]]}
        area.each {|pos| board[pos] = ship[0]}
    when "down"
      edge = placement[0] + (ship.length-1)
      area = (placement[0]..edge).map {|row| [row, placement[1]]}
        area.each {|pos| board[pos] = ship[0]}
    when "left"
      edge = placement[1] - (ship.length-1)
      area = (edge..placement[1]).map {|col| [placement[0], col]}
        area.each {|pos| board[pos] = ship[0]}
    when "right"
      edge = placement[1] + (ship.length-1)
      area = (placement[1]..edge).map {|col| [placement[0], col]}
      area.each {|pos| board[pos] = ship[0]}
    end
    
    board.grid.each {|row| p row}
  end
    
  def valid_direction?(placement, direction, ship, board)
    directions = ["up","down","left","right"]
    return false if !directions.include?(direction)
      
    case direction
    when "up"
      edge = placement[0] - (ship.length-1)
      return false if edge < 0
      return false if !clear?(placement, direction, edge, board)
    when "down"
      edge = placement[0] + (ship.length-1)
      return false if edge > 9
      return false if !clear?(placement, direction, edge, board)
    when "left"
      edge = placement[1] - (ship.length-1)
      return false if edge < 0
      return false if !clear?(placement, direction, edge, board)
    when "right"
      edge = placement[1] + (ship.length-1)
      return false if edge > 9
      return false if !clear?(placement, direction, edge, board)
    end
    
    true
  end

  def clear?(placement, direction, edge, board)
    case direction
    when "up"
      area = (edge..placement[0]).map {|row| [row, placement[1]]}
    when "down"
      area = (placement[0]..edge).map {|row| [row, placement[1]]}
    when "left"
      area = (edge..placement[1]).map {|col| [placement[0], col]}
    when "right"
      area = (placement[1]..edge).map {|col| [placement[0], col]}
    end
      
    area.all? {|pos| board[pos] == :o}
  end
  
end
