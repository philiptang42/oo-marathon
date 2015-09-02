class Zoo
  attr_reader :name, :cages, :employees, :animals
  def initialize(name)
    @name = name
    @cages = make_cages
    @employees = []
    @animals = []
  end


  def make_cages
    cages = []
      10.times do
        cages << Cage.new
      end
      cages
    end

  def add_employee(employee)
    @employees << employee
  end

  def add_animal(animal)
    raise ZooAtCapacity unless cages.last.empty?
    cages.each do |cage|
      if cage.empty?
        cage.animal = animal
        break
      end
    end
  end

  def visit
    greeting = ""
    employees.each do |employee|
      greeting += "#{employee.greet}\n"
    end
    cages.each do |cage|
      if not cage.empty?
        greeting += "#{cage.animal.speak}\n"
      end
    end
    greeting
  end
end


class ZooAtCapacity < StandardError

end
