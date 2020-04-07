require_relative "piece"
require_relative "null_piece"
require_relative "sliding_piece"
require_relative "stepping_piece"
require_relative "pawns"

class Board

    attr_accessor :rows

    def initialize
        @rows = Array.new(8) { Array.new(8) }
    end

    def setup_board #:white, :black
        valid_rows = [0, 1, 6, 7] #top two, top bottom are where pieces are set.
        @rows.each_with_index do | sub_arr, row_i |
            if valid_rows.include?(row_i)
                sub_arr.each_with_index do | _, col_i |
                    if row_i == 0 || row_i == 1
                        @rows[row_i][col_i] = SlidingPiece.new(:black, self, [row_i, col_i])
                    elsif row_i == 6 || row_i == 7
                        @rows[row_i][col_i] = SlidingPiece.new(:white, self, [row_i, col_i])
                    end
                end

            else
                sub_arr.each_with_index do | _, col_i |
                    @rows[row_i][col_i] = NullPiece.new(:color, self, [row_i, col_i])
                end

            end
        end
    end

    def print_board
        @rows.each do | sub_arr |
            render_row = ""
            sub_arr.each do | piece |
                if piece.is_a?(NullPiece)
                    render_row += "."
                else
                    piece.color == :white ? render_row += "w" : render_row += "b"
                end
                render_row += " "
            end
            puts render_row
        end
        puts
    end

    def valid_moves(pos)
        x, y = pos
        puts
        print @rows[x][y].get_moves
        puts
    end


    def move_piece(start_pos, end_pos)
        r1, c1 = start_pos
        r2, c2 = end_pos

        if @rows[r1][c1].is_a?(NullPiece)
            raise "Error, starting position is a null_piece"
        elsif @rows[r2][c2].is_a?(Piece) && !@rows[r2][c2].is_a?(NullPiece) #specify error on null cause null derives from piece
            raise "Error, there is a piece there." #Tentative, will change for capturing.
        end

        piece_color = @rows[r1][c1].color
        #for future reference save color before deleting
        @rows[r1][c1] = NullPiece.new(:color, self, [r1, c1])
        @rows[r2][c2] = SlidingPiece.new(piece_color, self, [r2,c2])

    end


end

b = Board.new
b.setup_board
b.print_board
b.move_piece([1,0], [2,0])
b.print_board
b.valid_moves([2,0])
b.rows[3][1] = SlidingPiece.new(:white, b, [3,1])
b.print_board
b.valid_moves([2,0])
#b.rows[0][0].get_moves
#b.move_piece([0,0], [4,6])

