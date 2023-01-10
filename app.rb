require_relative './student'
require_relative './book'
require_relative './teacher'
require_relative './rental'
require_relative './create_items'
require_relative './list_items'
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
    create = Create.new(@people, books, rentals)
    lists = List.new(@people, books, rentals)
    case input
    when '1'
      lists.list_of_books
    when '2'
      lists.list_of_people
    when '3'
      @people.push(create.create_person)
    when '4'
      @books.push(create.create_book)
    when '5'
      @rentals.push(create.create_rental)
    when '6'
      lists.list_of_rentals
    else
      'Invalid Input. Enter digit from 1 to 7'
    end
    go_back
  end

  def go_back
    puts ''
    print 'Press Enter to go back to menu '
    gets.chomp
    puts ''
  end
end
