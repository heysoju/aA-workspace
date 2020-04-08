require_relative "piece"
require_relative "slide_module"

class SlidingPiece < Piece

    include Slideable

    attr_accessor :symbol

    def initialize(color, board, pos)
        super
        @symbol = nil #:queen, :rook, :bishop 
    end

    def set_symbol(s)
        @symbol = s
    end

    def piece?(pos)
        x, y = pos
        @board.rows[x][y].is_a?(Piece) && !@board.rows[x][y].is_a?(NullPiece)
    end

    def get_unblocked_moves(direction)
        result = []
        direction.each do | pos |
            if piece?(pos) #If its a piece, then stop tracks here for this direction.
                x, y = pos
                result << pos if @color != @board.rows[x][y].color #Don't put position if same color
                break
            else
                result << pos
            end
        end
        result
    end

    def get_moves
        puts @symbol
        valid = []
        case @symbol
        when :bishop
            valid = diagonal_moves(@pos).map { | direction | get_unblocked_moves(direction) }
        when :rook
            valid = horizontal_vertical_moves(@pos).map { | direction | get_unblocked_moves(direction) }
        when :queen
            valid = all_directions(@pos).map { | direction | get_unblocked_moves(direction) }
        when nil
            puts "FUCKING NIL"
        end
        result = []
        valid.each { | direction | direction.each { | pos | result << pos } }
        result
    end

end