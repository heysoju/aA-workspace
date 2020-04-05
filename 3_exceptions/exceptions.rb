def sqrt(num)
  unless num >= 0
    raise ArgumentError.new "Cannot take sqrt of negative number"
  end

  # code to calculate square root...
end

def main
  # run the main program in a loop
  while true
    # get an integer from the user
    puts "Please input a number"
    num = gets.to_i

    begin
      sqrt(num)
    rescue ArgumentError => e
      puts "Couldn't take the square root of #{num}"
      puts "Error was: #{e.message}"
    end
  end
end

#Since we can't take the square root of a negative number, we raise an exception instead of 
#returning an answer. When an exception is raised, the method stops 
#executing. Instead of returning, an exception is thrown. The method's 
#caller then gets a chance to handle the exception:

#If the user feeds in a negative number, sqrt will raise an exception. Because main has 
#wrapped this code in a begin/rescue/end block, the exception will be caught. 
#The code will jump to the rescue block that anticipates an ArgumentError.
# It will save the exception in the variable e, then run the error handling code.
# If the calling method doesn't rescue (we also say catch or handle) 
# an exception, it continues to bubble up the call stack. So the caller's 
# caller gets a chance, then their caller, then...
# If no method throughout the entire call stack catches the exception, 
# the exception is printed to the user and the program exits.


