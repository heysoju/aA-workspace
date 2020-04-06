require_relative "employee"

class Manager < Employee

    attr_accessor :employees_assigned

    def initialize(name, title, salary, boss)
        super
        @employees_assigned = []
    end

    def bonus(multiplier)
        to_add = []
        to_add += @employees_assigned

        result = 0
        until to_add.empty?
            check = to_add.pop
            result += check.salary
            to_add += check.employees_assigned if check.is_a?(Manager)
        end

        result * multiplier
    end

    def print_employees
        @employees_assigned.each do | e |
            puts e
            puts e.employees_assigned if e.is_a?(Manager)
        end
        puts
    end

end