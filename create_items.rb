require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './list_items'

class Create
  def initialize(people, books, rentals)
    @books = books
    @people = people
    @rentals = rentals
    @list = List.new(people, books, rentals)
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]'
    select_person = gets.chomp.to_i
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
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    puts 'Book has been successfully created'
    book
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N] '
    has_permission = gets.chomp.downcase == 'y'

    student = Student.new(2, age, name, has_permission)
    puts 'Student has been successfully created'
    student
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'specialization '
    specialization = gets.chomp.downcase

    teacher = Teacher.new(specialization, age, name)

    puts 'Teacher has been created successfully'
    teacher
  end

  def create_rental
    puts 'Select a book from the following list by number (not id)'
    @list.list_of_books
    book_index = gets.chomp.to_i
    book = @books[book_index]

    puts 'Select a person from the following list by number (not id)'
    @list.list_of_people
    person_index = gets.chomp.to_i
    person = @people[person_index]

    print 'Date :'
    date = gets.chomp
    actual_date = Date.parse(date)

    rental = Rental.new(person, book, actual_date)
    puts 'Rental has been successfully created'
    rental
  end
end
