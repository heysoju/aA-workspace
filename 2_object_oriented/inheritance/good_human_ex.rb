class Animal
  attr_reader :species

  def initialize(species)
    @species = species
  end
end

class Human < Animal
  attr_reader :name

  def initialize(name)
    #super #just super, would have species name the same as name 
    super("Homo Sapien") #this version is more explicit.
    @name = name
  end
end

h = Human.new("Kevin")
puts h.species
puts h.name

# super calls the original definition of the method
# If we hadn't passed "Homo Sapiens" to super, then `name` would have
# been passed by default.