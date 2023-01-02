class Person
    attr_accessor = :id, :name, :age

    def initialize(name = "Unknown", age, parent_permission = true)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    def get_id
        return @id
    end

    def get_name
        return @name
    end

    def get_age
        return @age
    end

    def set_name(name)
        @name = name
    end

    def set_age(age)
        @age = age
    end

    def can_use_services?
        return self.is_of_age? || @parent_permission
    end

    private

    def is_of_age?
        return @age >= 18
    end





end