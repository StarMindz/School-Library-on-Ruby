require_relative './student'
require_relative './book'
require_relative './teacher'
require_relative './rental'
require 'date'
class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def run
    puts 'Welcome to Starminds School Library App!'
    puts ''
    puts ''
    puts 'Please put an option by entering a number!'
    until pick_option
      input = gets.chomp
      if input == '7'
        puts 'Thank you for using this app'
        break
      end
      run_option(input)
    end
  end

  def pick_option
    puts '1 - List all books'
    puts '2 - List all People'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - list all rentals for a given person id'
    puts '7 - Exit'
  end

  def run_option(input)
    case input
    when '1'
      list_of_books
    when '2'
      list_of_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_of_rentals
    else
      'Invalid Input. Enter digit from 1 to 7'
    end
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
    has_permission = gets.chomp.downcase == 'y'

    student = Student.new(nil, age, name, has_permission)
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

    teacher = Teacher.new(nil, age, specialization, name)
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

    rental = Rental.new(actual_date, book, person)
    @rentals.push(rental)

    puts 'Rental has been successfully created'
    go_back
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

  def list_of_rentals
    puts 'Select id of any person'
    @people.each { |person| puts "id: #{person.id}, Person: #{person.name}" }

    print 'Person id: '
    person_id = gets.chomp.to_i

    @rentals.each do |rental|
      if rental.person.id.to_i == person_id
        puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      end
    end
  end

  def go_back
    puts ''
    print 'Press Enter to go back to menu '
    gets.chomp
    puts ''
  end
end
