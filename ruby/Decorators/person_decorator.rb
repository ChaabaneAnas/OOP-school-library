class Nameable
  def correct_name
    raise NotImplementedError
  end
end

class BaseDecorator < Nameable
  def initialize(nameableobj)
    super()
    @nameable_obj = nameableobj
  end

  def correct_name
    @nameable_obj.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable_obj.correct_name.upcase
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable_obj.correct_name.slice(0..10)
  end
end
