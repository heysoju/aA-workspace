class Animal
  attr_reader :species

  def initialize(species)
    @species = species
  end
end

class Human < Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

h = Human.new("Kevin")
puts h.species
puts h.name

#Uh-oh! When we call Human.new, this won't set the species! 
#Let's fix that. Here is the second major way that super is called, 
#passing arguments explicitly: