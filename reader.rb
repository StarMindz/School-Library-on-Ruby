class Reader
  def read_person
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]'
    gets.chomp.to_i
  end

  def read_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    [title, author]
  end

  def read_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N] '
    has_permission = gets.chomp.downcase == 'y'
    [age, name, has_permission]
  end

  def read_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'specialization '
    specialization = gets.chomp.downcase
    [specialization, age, name]
  end

  def read_rentals(list, books, people)
    puts 'Select a book from the following list by number (not id)'
    list.list_of_books
    book_index = gets.chomp.to_i
    book = books[book_index]

    puts 'Select a person from the following list by number (not id)'
    list.list_of_people
    person_index = gets.chomp.to_i
    person = people[person_index]

    print 'Date :'
    date = gets.chomp
    actual_date = Date.parse(date)

    [person, book, actual_date]
  end

  def read_for_rental_lists(people)
    puts 'Select id of any person'
    people.each { |person| puts "id: #{person.id}, Person: #{person.name}" }

    print 'Person id: '
    gets.chomp.to_i
  end
end
