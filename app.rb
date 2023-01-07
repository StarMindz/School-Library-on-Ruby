class App
    attr_accessor :books, :people, :rentals
    
    def initialize
        @books = []
        @people = []
        @rentals = []

    def create_person
        print 'Do you want to create a student (1) or a teacher (2)? [input the number]'
        select_person = gets.chomp.to_i
        case select_person
        when 1
            create_student
        when 2
            create_teacher
        else
            puts 'invalid input'
        end
    end

    def create_book
        print 'Title: '
        title = gets.chomp
        print 'Author: '
        author = gets.chomp
        book = Book.new(title, author)
        @books.push(book)
        puts 'Book has been successfully created'
        go_back
    end


    def create_student
        print 'Age: '
        age = gets.chomp.to_i
        print 'Name: '
        name = gets.chomp
        print 'Has parent permission? [Y/N] '
        permission = gets.chomp.downcase == 'y'
    
        student = Student.new(nil, age, name, permission)
        @people.push(student)
        puts 'Student has been successfully created'
        go_back
    end
    
    def create_teacher
        print 'Age: '
        age = gets.chomp.to_i
        print 'Name: '
        name = gets.chomp
        print 'specialization '
        specialization = gets.chomp.downcase
    
        teacher = Teacher.new(age, specialization, name)
        @people.push(teacher)
        puts 'Teacher has been created successfully'
        go_back
    end

    def create_rental
        puts 'Select a book from the following list by number (not id)'
        list_of_books
        book_index = gets.chomp.to_i
        book = @book[book_index]
    
        puts 'Select a person from the following list by number (not id)'
        list_of_people
        person_index = gets.chomp.to_i
        person = @people[person_index]
        print 'Date :'
        date = gets.chomp
        actual_date = Date.parse(date)
    
        rental = Rental.new(date, book, person)
        @rentals.push(rental)
        puts 'Rental has been successfully created'
    end

    def list_of_people
        if @people.empty?
            puts 'No people found!'
            go_back
        end
        @people.each_with_index do |person, i|
            puts "#{i}) [#{person.classroom}] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
        end
    end

    def list_of_books
        if @books.empty?
            puts 'No Book found!'
            go_back
        end

        @books.each_with_index do |book, i|
            puts "#{i}) Title: #{book.title}, Author: #{book.author} "
        end
    end

end    

