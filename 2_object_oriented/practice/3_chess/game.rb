require_relative "board"

class Game

    def initialize
        @board = Board.new()
        @board.setup_board
        @board.print_board
    end

    def play

        while true

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
                puts "INVALID MOVE"
            end

        end

    end

end

if __FILE__ == $PROGRAM_NAME
    g = Game.new()
    g.play
end
