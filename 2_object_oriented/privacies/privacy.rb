class Cat
  public
#   Public methods can be called by anyone---there is no access control.
#    Methods are public by default (except for initialize, which is always private).

  def meow
    puts "meow"
  end

  # access control gets set until another access control statement is
  # seen.
  def other_public_method
  end

  private

#   private methods cannot be called with an explicit receiver. 
#   Because you cannot specify an object when using them, 
#   private methods can be called only in the defining class. ...

  def thoughts
    ...
  end

  protected
#   So protected methods can be called with an explicit receiver, 
#   so long as the caller is of the same class.
  def clean
    ...
  end
end