class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @author = author
    @title = title
    @rentals = []
  end

  def add_rentals(rental)
    @rentals.push(rental)
    rental.add_book(self) unless rental.book == self
  end
end
