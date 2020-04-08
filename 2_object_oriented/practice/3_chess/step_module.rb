module Stepable

    def knight_moves(pos)
        x, y = pos
        directions = [[-1, -2], [-1, 2], [1, -2], [1, 2]]
        directions.map { | move | [move[0] + x, move[1] + y] }
    end

    def king_moves(pos)
        x, y = pos
        directions = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
        directions.map { | move | [move[0] + x, move[1] + y] }
    end

end