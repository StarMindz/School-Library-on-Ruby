class List
  def initialize(people, books, rentals)
    @books = books
    @people = people
    @rentals = rentals
  end

  def list_of_people
    puts 'No people found!' if @people.empty?

    @people.each_with_index do |person, i|
      puts "#{i})  Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
  end

  def list_of_books
    puts 'No Book found!' if @books.empty?

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
end
