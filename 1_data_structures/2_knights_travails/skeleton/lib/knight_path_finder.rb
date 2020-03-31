require_relative "00_tree_node"

class KnightPathFinder

    attr_accessor :start, :considered_positions

    def self.valid_moves(pos)
        row, col = pos
        possible_moves = [
            [-2, -1], [-2, 1],
            [-1, -2], [-1, 2],
            [1, -2], [1, 2],
            [2, -1], [2, 1]
        ]
        get_moves = possible_moves.map { | r, c = move | [row + r, col + c] }
        get_moves.select { | r, c = move | r >= 0 && r < 8 && c >= 0 && c < 8 }
    end

    def initialize(pos)
        @start = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end

    def new_move_positions(pos)
        new_positions = KnightPathFinder.valid_moves(pos).select { | p | !@considered_positions.include?(p) }
        @considered_positions += new_positions
        new_positions
    end

    def build_move_tree
        queue = [@start]
        until queue.empty?
            node = queue.shift
            self.new_move_positions(node.value).each do | new_pos |
                next_node = PolyTreeNode.new(new_pos)
                node.add_child(next_node)
                queue << next_node
            end
        end
    end

    def traceback(node)
        tb = []
        to_view = [node]
        until to_view.empty?
            n = to_view.pop
            to_view << n.parent unless n.parent.nil?
            tb.unshift(n.value)
        end
        tb
    end

    def find_path(pos)
        found_node = @start.dfs(pos)
        self.traceback(found_node)
    end

end

if __FILE__ == $PROGRAM_NAME
    s = KnightPathFinder.new([0, 0])
    s.build_move_tree
    print s.find_path([7,6])
    puts
    print s.find_path([6,2])
    puts
end