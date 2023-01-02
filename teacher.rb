class Teacher < Person
    def initialize(specialization, name = "Unknown", age, parent_permission = true)
        @specialization = specialization
        super(name, age, parent_permission)
    end

    def can_use_services?
        return true
    end
end
