require
class Student < Person
    def initialize(classroom, name = "Unknown", age, parent_permission = true)
        @classroom = classroom
        super(name, age, parent_permission)
    end

    def play_hooky
        return "¯\(ツ)/¯"
    end
end