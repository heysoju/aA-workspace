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
        @board.rows.each do | row |
            row.each do | piece |
                if piece.symbol == :king && piece.color == :white
                    white_position = piece
                elsif piece.symbol == :king && piece.color == :black
                    black_position = piece
                end
            end
        end
        [white_position, black_position]
    end

    def simulation_1
        simulate_intro = [
            [[1,3], [2,3]], 
            [[2,3], [3,3]], 
            [[6,3], [5,3]], 
            [[5,3], [4,3]],

            [[0,3], [2,3]],
            [[2,3], [4,1]],
            [[4,1], [4,3]],
            [[4,3], [7,3]],
            [[6,5], [5,5]],
            [[0,2], [5,6]]
        ]

        simulate_intro.each do | start, dest = sub_arr |
            @board.move_piece(start, dest)
        end

    end

    def simulation_2
        #There dont move validly.
        simulate_intro = [
            [[1,3], [2,3]], 
            [[2,3], [3,3]], 
            [[6,3], [5,3]], 
            [[5,3], [4,3]],

            [[0,3], [2,3]],
            [[2,3], [4,1]],
            [[4,1], [4,3]],
            [[4,3], [7,3]],
            [[6,5], [5,5]],
            [[0,2], [5,6]],
            [[0,1], [5,4]]
        ]

        simulate_intro.each do | start, dest = sub_arr |
            @board.move_piece(start, dest)
        end

    end



    def play

        simulation_2
        while true

            #gotta change to simply keep updating and finding the kings locations
            #in order to keep checking.
            white_king, black_king = self.get_kings
    
            if @board.check(white_king.pos)
                puts "White king in check"
                @board.checkmate?(white_king)
            end
            if @board.check(black_king.pos)
                puts "Black king in check"
                @board.checkmate?(black_king)
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
