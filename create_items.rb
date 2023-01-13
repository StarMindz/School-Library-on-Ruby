require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './list_items'
require_relative './reader'

class Create
  def initialize(people, books, rentals)
    @books = books
    @people = people
    @rentals = rentals
    @list = List.new(people, books, rentals)
    @validate = Reader.new
  end

  def create_person
    select_person = @validate.read_person
    case select_person
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'invalid input. Input either 1 or 2 according to your choice'
    end
  end

  def create_book
    title, author = @validate.read_book

    book = Book.new(title, author)
    puts 'Book has been successfully created'
    book
  end

  def create_student
    age, name, has_permission = @validate.read_student

    student = Student.new(2, age, name, has_permission)
    puts 'Student has been successfully created'
    student
  end

  def create_teacher
    specialization, age, name = @validate.read_teacher

    teacher = Teacher.new(specialization, age, name)
    puts 'Teacher has been created successfully'
    teacher
  end

  def create_rental
    person, book, actual_date = @validate.read_rentals(@list, @books, @people)

    rental = Rental.new(person, book, actual_date)
    puts 'Rental has been successfully created'
    rental
  end
end
