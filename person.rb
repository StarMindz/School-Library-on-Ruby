require_relative './nameable'
require_relative './trimmer_decorator'
require_relative './capitalize_decorator'
require_relative './base_decorator'
# Parent class for all other children classes
class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  attr_accessor :name, :age
  attr_writer :id
  attr_reader :rentals

  def correct_name
    @name
  end

  def add_rentals(rental)
    rentals.push(rental)
    rental.add_person(self) unless rental.person == self
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

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
