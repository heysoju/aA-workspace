class PolyTreeNode

    attr_accessor :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent)
        @parent.children.delete(self) unless @parent.nil?
        @parent = parent
        @parent.children << self unless @parent.nil? || @parent.children.include?(self)
    end

    def add_child(child)
        child.parent = self
        @children << child unless @children.include?(child)
    end

    def remove_child(child)
        child.parent = nil
        if @children.include?(child)
            @children.delete(child)
        else
            raise "Given child position is not a child of this node."
        end
    end

    def dfs(target)
        return self if @value == target
        @children.each do | node |
            value = node.dfs(target)
            return value unless value.nil?
        end
        nil
    end

    def bfs(target)
        queue = [self]
        until queue.empty?
            node = queue.shift
            if node.value == target
                return node
            else
                queue += node.children
            end
        end
        nil
    end

    def print_children #Very important function that I created to test.
        "Layer 1 Example"
        result = @children.map { | child | child.value }
        puts "#{result}"

        "Layer 2 Example"
        @children.each do | child | 
            result2 = []
            child.children.each do | c |
                result2 << c.value
            end
            puts "#{child.value} children = #{result2}"
        end
    end
end