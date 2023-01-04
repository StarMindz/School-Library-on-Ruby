require_relative './nameable'
# Parent class for all other children classes
class Person < Nameable
  def initialize(nameable, age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @nameable = nameable
    super()
  end

  attr_accessors :id, :name, :age
  attr_writer :name, :age

  def correct_name
    @nameable.correct_name
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end
end
