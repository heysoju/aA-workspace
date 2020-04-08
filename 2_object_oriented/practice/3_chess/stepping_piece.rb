require_relative "piece"

class SteppingPiece < Piece

    include Slideable

    def initialize(color, board, pos)
        super
    end

    def set_symbol(s)
        @symbol = s
    end

    def piece?(pos)
        x, y = pos
        @board.rows[x][y].is_a?(Piece) && !@board.rows[x][y].is_a?(NullPiece)
    end



end