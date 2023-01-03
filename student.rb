require_relative './person'

# Inherit all properties and methos of person class. And add playhook function
class Student < Person
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
