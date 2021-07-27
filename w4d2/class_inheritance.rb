class Employee

    attr_reader :name, :title, :salary
    attr_accessor :boss

    def initialize(name, title, salary, boss = nil)
        @name, @title, @salary = name, title, salary
        # self.boss = boss
        self.boss = boss
    end

    def boss=(boss)
        @boss = boss
        if !boss.nil?
            boss.add_employee(self)
        end
    end


    def bonus(multiplier)
        salary * multiplier
    end
end

class Manager < Employee

    attr_reader :employees

    def initialize(name, title, salary, boss=nil)
        super(name, title, salary, boss)
        @employees = []
    end

    def bonus(multiplier)
        total_salary * multiplier
    end

    def add_employee(employee)
        self.employees << employee
    end

    def total_salary
        total = 0
        self.employees.each do |employee|
            if !employee.is_a?(Manager)
                total += employee.salary
            else
               total += employee.salary + employee.total_salary
            end
        end
        total
    end
end

# Ned = Manager.new("Ned", "Founder", 1000000)
# Darren = Manager.new("Darren", "TA Manager", 78000, Ned)
# Shawna = Employee.new("Shawna", "TA", 12000, Darren)
# David = Employee.new("David", "TA", 10000, Darren)

# p Darren.boss
# puts
# p Darren.employees