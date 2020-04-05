class Cat
    attr_accessor :name

    def initialize(name)
        @name = name
    end

    private
    def stuff
        if @name == "Kevin"
            puts "hi"
        else
            puts "nah"
        end
    end

    public
    def show_e
        self.stuff #while being explicit, this is the same as saying c.stuff which
        #wont be allowed cause its private
        #self.stuff is same as saying c.stuff
    end

    public
    def show_i
        stuff    #this is being called while in the class and non explicit so its ok
    end

end

c = Cat.new("Kevin")
c.stuff
c.show_i
c.show_e
