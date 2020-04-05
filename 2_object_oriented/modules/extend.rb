module Findable
  def objects
    @objects ||= {}
  end

  def find(id)
    objects[id]
  end

  def track(id, object)
    objects[id] = object
  end
end

class Cat
  extend Findable
  
  def initialize(name)
    @name = name
    Cat.track(@name, self)
  end
end

Cat.new("Gizmo")
Cat.find("Gizmo") # finds Gizmo Cat object