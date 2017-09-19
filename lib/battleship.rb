require_relative 'player'
require_relative 'board'
require_relative 'ComputerPlayer'

class BattleshipGame
    
  attr_accessor :board, :player1, :player2, :current_player, :other_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @other_player = player2
    @board = @other_player.board
  end
    
  def setup
    player1.setup
    system('clear')
    player2.setup
    system('clear')
  end

  def game_over?
    current_player.board.won? || other_player.board.won?
  end
    
  def attack(pos)
    
    if board[pos] != :o
      puts "#{pos} was a hit"
      current_player.display[pos] = :X
    else
      puts "#{pos} was a miss"
      current_player.display[pos] = :x
    end 
      
    board[pos] = :x
    current_player.render

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
      until gets
      end
      system('clear')
      switch_players
    end

    puts "congrats #{other_player.name}, you have destroyed all #{current_player.name}'s battleships!"
  
  end 
    
  def play_turn
      puts "It is now #{current_player.name}'s turn..."
      puts "the board in play is #{board}"
      puts "there are #{count} ship spots left on this board..."
      current_player.render
      play = current_player.get_play
      attack(play)
  end

  def count
    board.count
  end
  
end

if $PROGRAM_NAME == __FILE__
  puts "Welcome to Battleship!"
  puts "What kind of game do you want to play:
        A: Human V. Computer
        B: Human V. Human
        C: Computer V. Computer"
  game_type = gets.chomp.downcase
  if game_type == "a"
    human = HumanPlayer.new("Human")
    comp = ComputerPlayer.new("Computer")
    g = BattleshipGame.new(human, comp)
    g.setup
    g.play
  elsif game_type == "b"
    human1 = HumanPlayer.new("Human1")
    human2 = HumanPlayer.new("Human2")
    g = BattleshipGame.new(human1, human2)
    g.setup
    g.play
  elsif game_type == "c"
    comp1 = ComputerPlayer.new("Computer1")
    comp2 = ComputerPlayer.new("Computer2")
    g = BattleshipGame.new(comp1, comp2)
    g.setup
    g.play
  else
    puts "please enter 'A', 'B', or 'C' game type..."
  end
  
end