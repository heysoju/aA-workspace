require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if @board.over?
      return @board.winner != evaluator && !@board.winner.nil?
    end

    if @next_mover_mark == evaluator
      self.children.all? { | c | c.losing_node?(evaluator)}
    else
      self.children.any? { | c | c.losing_node?(evaluator)}
    end
   
  end

  def winning_node?(evaluator)
    if @board.over?
      return @board.winner == evaluator
    end

    if @next_mover_mark == evaluator
      self.children.any? { | c | c.winning_node?(evaluator) }
    else
      self.children.all? { | c | c.winning_node?(evaluator) }
    end
    
    
  end

  
  def children
    moves = []
    (0..2).each do | row_idx |
      (0..2).each do | col_idx |
        pos = [row_idx, col_idx]
        if @board.empty?(pos)
          new_board = @board.dup
          new_board[pos] = @next_mover_mark
          mark = @next_mover_mark == :x ? :o : :x
          moves << TicTacToeNode.new(new_board, mark, pos)
        end
      end
    end
    moves
  end

end