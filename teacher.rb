require_relative './person'

# Inherit all properties and methos of person class. And overwrite can_use_service? function

class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
