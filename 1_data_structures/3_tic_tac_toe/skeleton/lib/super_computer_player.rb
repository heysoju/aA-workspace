require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)
    node.children.each do | n |
      if n.winning_node?(mark)
        return n.prev_move_pos # this is the move made in that baord
      end
    end

    node.children.each do | n |
      unless n.losing_node?(mark)
        return n.prev_move_pos # this is the move made in that board
      end
    end

    raise "There are no non-losing nodes"



  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
