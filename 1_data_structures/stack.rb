class Stack
    attr_reader :arr

    def initialize
        @arr = []
    end

    def push(el)
        @arr << el
    end

    def pop
        @arr.pop
    end

    def peek
        @arr.last
    end
    
end