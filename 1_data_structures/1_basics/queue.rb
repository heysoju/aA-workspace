class Queue
    attr_reader :arr

    def initialize
        @arr = []
    end

    def enqueue(el)
        @arr << el
    end

    def dequeue
        @arr.shift
    end

    def peek
        @arr.first
    end

end