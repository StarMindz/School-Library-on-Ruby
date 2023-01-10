class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date
  end

  def add_book(book)
    @book = book
    book.add_rentals(self) unless book.rentals.include?(self)
  end

  def add_person(person)
    @person = person
    @person.add_rentals(self) unless person.rentals.include?(self)
  end
end
