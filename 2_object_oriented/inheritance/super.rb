class Animal
  def make_n_noises(n = 2)
    n.times { print "Growl " }
  end
end

class Liger < Animal
  def make_n_noises(num = 4)
    num.times { print "Roar " }
    # here we'll call super without any arguments. This will pass on `num`
    # implicitly to super. You can think of this call to super as:
    # `super(num)`
    super
  end
end

Liger.new.make_n_noises(3) # => Roar Roar Roar Growl Growl Growl

#4 is the default
#if u just call the super method without any arguments, it will take the variables
#given by default in this subclass.