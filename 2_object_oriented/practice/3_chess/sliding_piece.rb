require_relative "piece"

module Slideable

    def top_left_diagonal(pos)
        possible_moves = []
        x, y = pos
        until x <= 0 || y <= 0
            possible_moves << [x - 1, y - 1] if x - 1 >= 0 && y - 1 >= 0
            x -= 1
            y -= 1
        end
        possible_moves
    end

    def top_right_diagonal(pos)
        possible_moves = []
        x, y = pos
        until x <= 0 || y >= 7
            possible_moves << [x - 1, y + 1] if x - 1 >= 0 && y + 1 <= 7
            x -= 1
            y += 1
        end
        possible_moves
    end

    def bottom_left_diagonal(pos)
        possible_moves = []
        x, y = pos
        until x >= 7 || y <= 0
            possible_moves << [x + 1, y - 1] if x + 1 <= 7 && y - 1 >= 0
            x += 1
            y -= 1
        end
        possible_moves
    end

    def bottom_right_diagonal(pos)
        possible_moves = []
        x, y = pos
        until x >= 7 || y >= 7
            possible_moves << [x + 1, y + 1] if x + 1 <= 7 && y + 1 <= 7
            x += 1
            y += 1
        end
        possible_moves
    end

    

    



    def top_right_diagonal()
    
end

class SlidingPiece < Piece

    def initialize(color, board, pos)
        super
    end

end