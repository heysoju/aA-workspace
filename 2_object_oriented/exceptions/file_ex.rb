
begin
  a_dangerous_operation
rescue StandardError => e
  puts "Something went wrong: #{e.message}"
ensure
  puts "No matter what, make sure to execute this!"
end

f = File.open
begin
  f << a_dangerous_operation
ensure
  # must. close. file.
  f.close
end