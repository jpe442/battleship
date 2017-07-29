class HumanPlayer
    
  def initialize(name)
    @name = name
  end
    
  def get_play(string)
    string.split(",").map {|ch| ch.to_i}
  end
    
end
