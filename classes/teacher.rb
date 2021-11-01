require_relative 'person'

class Teacher < Person
  def initialize(specialization, age, name = 'Unkown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end