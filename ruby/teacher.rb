require './person'

class Teacher < Person
  def initialize(specialization)
    super(age, parent_permission, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
