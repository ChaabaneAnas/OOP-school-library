require '../Decorators/person_decorator'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknownn', parent_permission: true)
    super()
    @id = rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    @parent_permission || @age >= 18
  end

  private

  def of_age?
    can_use_services?
  end
end
