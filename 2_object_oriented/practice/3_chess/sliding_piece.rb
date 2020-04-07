require_relative "piece"
require_relative "slide_module"

class SlidingPiece < Piece

    include Slideable

    def initialize(color, board, pos)
        super
        @symbol = "" #:queen, :rook, :bishop 
    end

    def piece?(pos)
        x, y = pos
        !@board.rows[x][y].is_a?(NullPiece) && @board.rows[x][y].is_a?(Piece)
    end

    def get_moves
        valid_moves = diagonal_moves(@pos).map do | sub_dir_arr |
            block_checked = []
            sub_dir_arr.each do | pos |
                if piece?(pos) #if its a piece, then stop ur tracks here.
                    x, y = pos
                    block_checked << pos if @color != @board.rows[x][y].color
                    break
                else
                    block_checked << pos
                end

            end
            block_checked
        end
        valid_moves # arr of arrays
    end

end

#s = SlidingPiece.new(:white, [], [3,3])
#s.get_moves