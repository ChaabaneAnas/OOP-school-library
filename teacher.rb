require './person'

class Teacher < Person
  attr_reader :id
  attr_accessor :specialization, :rentals
  def initialize(name, age, specialization, id )
    super(name,age,id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

