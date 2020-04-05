# Method and class definitions are implicitly wrapped in a begin/end block, 
# so if your error handling applies to the whole method, all you have 
# to add is rescue.

def slope(pos1, pos2)
  (pos2.y - pos1.y) / (pos2.x - pos1.x)
rescue ZeroDivisionError
  nil
end

def echo_name
  fname, lname = prompt_name

  puts "Hello #{fname} of #{lname}"
rescue
  puts "Please only use two names."
  retry
end