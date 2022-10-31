class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, _parent_permission, name = 'Unknownn')
    @id = rand(1..100)
    @name = name
    @age = age
  end

  def can_use_services?
    true if age >= 18
  end

  private

  def of_age?
    false if age >= 18
  end
end
