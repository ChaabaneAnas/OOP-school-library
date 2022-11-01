class Person
  attr_accessor :name, :age
  attr_reader :id

  # rubocop:disable Lint/UnusedMethodArgument
  def initialize(age, name = 'Unknownn', parent_permission: true)
    # rubocop:enable Lint/UnusedMethodArgument
    @id = rand(1..100)
    @name = name
    @age = age
  end

  def can_use_services?
    true if age >= 18
  end

  private

  def of_age?
    can_use_services?
  end
end
