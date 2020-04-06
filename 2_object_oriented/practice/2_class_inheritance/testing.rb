require_relative "manager"
require_relative "employee"


ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

darren.add_to_manager
shawna.add_to_manager
david.add_to_manager

ned.print_info
darren.print_info
shawna.print_info
david.print_info

ned.print_employees
darren.print_employees


puts ned.bonus(5)
puts darren.bonus(4)
puts david.bonus(3)
