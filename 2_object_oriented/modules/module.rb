#Modules
#A Ruby module is like a class, except you don't instantiate a module. 
#Modules consist of methods that can be mixed in to a Ruby class. In Ruby, 
#we use a module to collect methods that may be mixed in and shared by many 
#classes to keep our code DRY.
#Let's see an example:

module Greetable
  def greet
    "Hello, my name is #{self.name}"
  end
end

class Human
  include Greetable
  
  def initialize(name)
    @name = name
  end
  
  def name
    @name
  end
end

class Robot
  include Greetable
  
  def name
    "Robot Model #2000"
  end
end


#We "mix in" a module by using the #include method. 
#This will take the methods defined in the module and make 
#them available to instances of Robot and Human.

#Note that module methods may call methods of the class that 
#they are mixed into. In this case, the Greetable module needs
# to access a name method. Both Robot and Human have name methods.

#The most famous module is Enumerable. All the various methods of
# Enumerable are defined in terms of an each method, which the class 
#(be it Array, Hash, etc.) must define. I sometimes describe modules as 
#"power packs", in that they extend the abilities of a class.#