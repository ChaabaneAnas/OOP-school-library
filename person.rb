require './person_decorator'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :parent_permission, :id

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(name, age, id, parent_permission = true)
    # rubocop:enable Style/OptionalBooleanParameter
    super()
    @id = id
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
