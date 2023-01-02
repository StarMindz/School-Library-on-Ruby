class Person
    attr_accessors = :id, :name, :age

    def initialize(name = "Unknown", age, parent_permission = true)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

end