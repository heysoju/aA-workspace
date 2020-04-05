#private methods cannot be called with an explicit receiver. 
#Because you cannot specify an object when using them, private 
#methods can be called only in the defining class. ...

class MyClass
   private
   def private_thing
      puts "Hello World"
   end

   public
   def explicit_receiver
      self.private_thing #same as saying c.stuff
   end


   def implicit_receiver
      private_thing 
   end
end

thing = MyClass.new
thing.implicit_receiver
#Hello World
# => nil
thing.explicit_receiver
#error

#Private methods are inherited as private. So if we say: