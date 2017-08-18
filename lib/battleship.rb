require_relative 'player'
require_relative 'board'
require_relative 'ComputerPlayer'

class BattleshipGame
    
  attr_accessor :board, :player1, :player2, :current_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @other_player = player2
    @board = @other_player.board
  end
    
  def setup
    @player1.setup
    system('clear')
    @player2.setup
    system('clear')
  end

  def game_over?
    @player1.board.won? || @player2.board.won?
  end
    
  def attack(pos)
    if @board[pos] != nil
      puts "#{pos} was a hit"
      @current_player.display[pos] = :X 
    else
      puts "#{pos} was a miss"
      @current_player.display[pos] = :x
    end 
      
    @board[pos] = :x
  end

  def switch_players
    if @current_player == player1
      @current_player = player2
      @other_player = player1
      @board = @other_player.board
    else
      @current_player = player1
      @other_player = player2
      @board = @other_player.board
    end

  end

  def play
    until game_over?
      play_turn
      switch_players
    end

    puts "congrats #{@other_player.name}, you have destroyed all the #{@current_players} battleships!"
  
  end 
    
  def play_turn
      puts "It is now #{@current_player.name}'s turn..."
      puts "the board in play is #{@board}"
      @current_player.render
      play = @current_player.get_play
      attack(play)
  end

end

if $PROGRAM_NAME == __FILE__
  h = HumanPlayer.new("h")
  j = ComputerPlayer.new("j")
  g = BattleshipGame.new(h, j)
  g.setup
  g.play
end