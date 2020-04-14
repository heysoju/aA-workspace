require_relative "board"

class Game

    def initialize
        @board = Board.new()
        @board.setup_board
        @board.print_board
    end

    def get_kings
        white_position = []
        black_position = []
        @board.each do | rows |
            rows.each do | pieces |
                if piece.symbol == :king && piece.color == :white
                    white_position = piece.pos
                elsif piece.symbol == :king && piece.color == :black_king
                    black_position = piece.pos
                end
            end
        end
        [white_position, black_position]
    end

    def play

        while true


            #gotta change to simply keep updating and finding the kings locations
            #in order to keep checking.
            white_king, black_king = get_kings
      
            if @board.check(white_king)
                puts "White king in check"
            end
            if @board.check(black_king)
                puts "Black king in check"
            end

            puts "Please choose a piece to move: "
            start = gets.chomp.split(",")
            s = start.map(&:to_i)
            puts "Please choose a the destination: "
            destination = gets.chomp.split(",")
            d = destination.map(&:to_i)

            if @board.valid_move?(s, d)
                puts "VALID MOVE WOOO"
                @board.move_piece(s, d)
            else
                puts "INVALID MOVE BOOO"
            end

        end

    end

end

if __FILE__ == $PROGRAM_NAME
    g = Game.new()
    g.play
end
