class Map
    attr_accessor :arr

    def initialize
        @arr = [[5,0], [4,3]]
    end

    def set(k, v)
        keys = @arr.map { | k, v = pair | k }
        if keys.include?(k)
            index = keys.index(k)
            @arr[index][1] = v
        else
            @arr << [k, v]
        end
    end

    def get(k)
        @arr.each { | key, value = pair | return value if k == key }
        return nil
    end

    def delete(k)
        delete_idx = nil
        @arr.each_with_index do | pair, idx |
            key, value = pair
            delete_idx = idx if key == k
        end
        @arr.delete_at(delete_idx) if delete_idx != nil
    end

    def show
        puts "#{@arr}"
    end

end