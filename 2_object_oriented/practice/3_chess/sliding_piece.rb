require_relative "piece"
require_relative "slide_module"

class SlidingPiece < Piece

    include Slideable

    def initialize(color, board, pos)
        super
    end

    def not_null?(pos)
        x, y = pos
        !@board.rows[x][y].is_a?(NullPiece) && @board.rows[x][y].is_a?(Piece)
    end

    def get_moves
        tl, tr, bl, br = diagonal_moves(@pos)
        print tl
        puts
        print tr
        puts
        print bl
        puts
        print br
        puts
        #puts not_null?([0,1])
    end

end

#s = SlidingPiece.new(:white, [], [3,3])
#s.get_moves