require_relative './person'

# Inherit all properties and methos of person class. And add playhook function
class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name, parent_permission)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def add_class(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
