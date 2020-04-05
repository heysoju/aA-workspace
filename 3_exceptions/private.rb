#All methods after the private keyword are private to the class.

#What kind of methods should be private? Ones which users of the class should not call, either for safety reasons (user doesn't know when they should start_engine) or because they're low-level details that don't conce

#Instance variables are always "private" in the sense that they are not even methods. You can expose instance variables to the outside world by making public getter/setter methods using attr_accessor and the like.


class Airplane
  def fly
    start_engine
    ...
  end

  private
  def start_engine
    ...
  end
end
