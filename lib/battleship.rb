class BattleshipGame
  attr_reader :board, :player

  def initialize(player, board)
    @player = player
    @board = board
  end
    
  def game_over?
    @board.won?
  end
    
  def attack(pos)
    @board[pos] = :x
  end
    
  def count
    @board.count
  end
    
  def play_turn
    puts "Which position would you like to fire upon?"
    play = player.get_play($stdin.gets.chomp)
    attack(play)
  end
    
    
end
