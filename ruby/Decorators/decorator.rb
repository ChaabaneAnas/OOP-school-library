

class Nameable
  def correct_name
    raise NotImplementedError
  end 
end 

class BaseDecorator < Nameable
  def initialize(nameableObj)
    @NameableObj  = nameableObj
  end 

  def correct_name
    @NameableObj.correct_name
  end 
end 

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @NameableObj.correct_name.upcase
  end 
end 

class TrimmerDecorator < BaseDecorator
  def correct_name
    @NameableObj.correct_name.slice(0..10)
  end 
end 


