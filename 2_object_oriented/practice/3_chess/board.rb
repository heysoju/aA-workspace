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

    def set_pawns(row, col)
        color = row == 1 ? :black : :white
        @rows[row][col] = Pawn.new(color, self, [row, col])
        @rows[row][col].set_symbol(:pawn)
    end

    def set_rooks(row, col, color)
        @rows[row][col] = SlidingPiece.new(color, self, [row, col])
        @rows[row][col].set_symbol(:rook)
    end

    def set_knights(row, col, color)
        @rows[row][col] = SteppingPiece.new(color, self, [row, col])
        @rows[row][col].set_symbol(:knight)
    end

    def set_bishops(row, col, color)
        @rows[row][col] = SlidingPiece.new(color, self, [row, col])
        @rows[row][col].set_symbol(:bishop)
    end

    def set_queens(row, col, color)
        @rows[row][col] = SlidingPiece.new(color, self, [row, col])
        @rows[row][col].set_symbol(:queen)
    end

    def set_kings(row, col, color)
        @rows[row][col] = SteppingPiece.new(color, self, [row, col])
        @rows[row][col].set_symbol(:king)
    end


    def set_pieces(row, col)
        if row == 1 || row == 6
            set_pawns(row, col)
        elsif row == 0 || row == 7
            case col
            when 0, 7
                row == 0 ? set_rooks(row, col, :black) : set_rooks(row, col, :white)
            when 1, 6
                row == 0 ? set_knights(row, col, :black) : set_knights(row, col, :white)
            when 2, 5
                row == 0 ? set_bishops(row, col, :black) : set_bishops(row, col, :white)
            when 3
                row == 0 ? set_queens(row, col, :black) : set_queens(row, col, :white)
            when 4
                row == 0 ? set_kings(row, col, :black) : set_kings(row, col, :white)
            end
        end

    end

    def set_null(row, col)
        @rows[row][col] = NullPiece.new(:color, self, [row, col])
    end

    def setup_board
        valid_rows = [0, 1, 6, 7]
        @rows.each_with_index do | sub_arr, row_i |
            if valid_rows.include?(row_i)
                sub_arr.each_with_index { | _, col_i | set_pieces(row_i, col_i) }
            else
                sub_arr.each_with_index { | _, col_i | set_null(row_i, col_i) }
            end
        end
    end

    def piece?(pos)
        x, y = pos
        @board.rows[x][y].is_a?(Piece) && !@board.rows[x][y].is_a?(NullPiece)
    end

    def check(pos)
        @rows.each do | row |
            row.each do | piece |
                if piece?(piece.pos)
                    return true if piece.get_moves.include?(pos)
                end
            end

        end
        false
    end

    def checkmate?(color)

        king = nil
        @rows.each do | row |
            row.each do | piece |
                king = piece if piece.symbol == :king && piece.color != color
            end
        end

        valid = []
        unvalid = []

        moves = king.get_moves

        unless moves.empty?
            moves.each do | move |
                if check?(move) #if one piece can check u, u cant do this if u take
                    unvalid << move
                else
                    valid << move
                end
            end
        end



        #Now we gotta fuckin check if theres a possible move that can kill the piece thats checking u
        if valid.empty?
            unvalid.each do | move |
                #HERE we gonna try and find anything that can kill its ass

            end

        end

        return true #if we exhaust all our options, then yeah we conclude checkmate


        




        #Check all adjacent pieces
            #if the are opposite color, if you take will u be in check?
                    #if so thats not valid
            #if the are opposite color, if you take and not in check, not mated yet.
        #if all valid moves for opponent king is [], then thats one set of checks done

        #then check for any surrounding moves that can prevent checkmate for that color
        #search all pieces of that kings color and see if the coordinate where the
        #piece is causing the check can be killed. if no pieces can kill that position
        #then its official checkmate.
    end

    def print_board
        @rows.each do | sub_arr |
            render_row = ""
            sub_arr.each do | piece |
                if piece.is_a?(NullPiece)
                    render_row += ". "
                else
                    piece.color == :white ? render_row += "*" : render_row += "$"
                    case piece.symbol
                    when :pawn
                        render_row += "P"
                    when :rook
                        render_row += "R"
                    when :knight
                        render_row += "N"
                    when :bishop
                        render_row += "B"
                    when :queen
                        render_row += "Q"
                    when :king
                        render_row += "K"
                    end
                end
                render_row += "  "
            end
            puts render_row
        end
        puts
    end

    def valid_move?(start, dest)
        x, y = start
        valid_moves = @rows[x][y].get_moves
        puts
        print valid_moves
        puts
        valid_moves.include?(dest)
    end

    def move_piece(start_pos, end_pos)
        r1, c1 = start_pos
        r2, c2 = end_pos

        #if @rows[r1][c1].is_a?(NullPiece)
            #raise "Error, starting position is a null_piece"
        #elsif @rows[r2][c2].is_a?(Piece) && !@rows[r2][c2].is_a?(NullPiece) #specify error on null cause null derives from piece
            #raise "Error, there is a piece there." #Tentative, will change for capturing.
        #end

        piece_color = @rows[r1][c1].color
        piece_type = @rows[r1][c1].symbol

        @rows[r1][c1] = NullPiece.new(:color, self, [r1, c1])

        case piece_type
        when :pawn
            @rows[r2][c2] = Pawn.new(piece_color, self, [r2, c2])
        when :rook, :bishop, :queen
            @rows[r2][c2] = SlidingPiece.new(piece_color, self, [r2, c2])
        when :knight, :king
            @rows[r2][c2] = SteppingPiece.new(piece_color, self, [r2, c2])
        end

        @rows[r2][c2].set_symbol(piece_type)


        print_board


    end


end

#b = Board.new
#b.setup_board
#b.print_board

# b.move_piece([1,3], [2,3])
# b.rows[3][2] = Pawn.new(:black, b, [3,2])
# b.print_board
# b.valid_move?([2,3])

# #test
# b.rows[3][3] = Pawn.new(:white, b, [3,3])
# b.rows[3][4] = Pawn.new(:white, b, [3,4])
# b.rows[3][2].set_symbol(:pawn)
# b.rows[3][3].set_symbol(:pawn)
# b.rows[3][4].set_symbol(:pawn)


# b.print_board
# b.valid_move?([3,4])

#b.rows[0][0].get_moves
#b.move_piece([0,0], [4,6])