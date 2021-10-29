require_relative 'corrector'

class Person
  attr_accessor :age, :name
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @corrector = Corrector.new
    @name = validate_name(name)
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services
    is_of_age || @parent_permission
  end

  private

  def of_age
    @age >= 18
  end

  def validate_name(name)
    @corrector.correct_name(name)
  end
end