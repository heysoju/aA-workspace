

class Employee
    attr_accessor :name, :title, :salary, :boss

    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        bonus = (@salary) * multiplier
    end

    def add_to_manager
        @boss.employees_assigned << self
    end

    def print_info
        puts "name: #{@name}"
        puts "title: #{@title}"
        puts "salary: #{@salary}"
        if @boss.nil?
            puts "boss: none"
        else
            puts "boss: #{@boss.name}"
        end
        puts
    end

end