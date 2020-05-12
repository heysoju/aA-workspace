class Array
    def my_uniq
        h = Hash.new
        self.each { | ele | h[ele] = true }
        h.keys
    end

    def two_sum
        pos = []
        self.each_with_index do | ele, idx |
            self.each_with_index do | ele2, idx2 |
                if idx < idx2
                    pos << [idx, idx2] if ele + ele2 == 0
                end
            end
        end
        pos
    end

    def my_transpose
        h = Hash.new { | hash, k | hash[k] = [] }
        self.each do | sub_arr |
            sub_arr.each_with_index { | ele, idx | h[idx] << ele }
        end
        h.values
    end

    def stock_picker
        max = []
        max_value = 0
        self.each_with_index do | stock, idx |
            self.each_with_index do | stock2, idx2|
                if idx < idx2 && stock2 > stock
                    if max.empty? || (stock2 - stock > max_value)
                        max = [idx, idx2]
                        max_value = stock2 - stock
                    elsif (stock2 - stock == max_value)
                        if max.first.is_a?(Integer)
                            first_pair = [max[0], max[1]]
                            max = [first_pair, [idx, idx2]]
                        else
                            max << [idx, idx2]
                        end
                    end
                end
            end
        end
        max
    end

    def prompt_move
        puts
        puts "Please choose a stack start: "
        s = gets.chomp.to_i
        puts "Please choose a stack dest: "
        d = gets.chomp.to_i
        [s, d]
    end

    def tower_hanoi
        total_stacks = 0
        self.each { | sub_arr | total_stacks += sub_arr.length }
        until self.last.length == total_stacks
            puts "TOWER: #{self}"
            s, d = prompt_move
            if self[d].empty? || self[d].last >= self[s].last
                self[d] << self[s].pop

            else
                puts "ERROR, TOO BIGGGGG TO STACK"

            end
        end
        puts "FINISHED #{self}"
    end

end
