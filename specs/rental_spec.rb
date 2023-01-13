require_relative './../book'
require_relative './../rental'
require_relative './../student'

describe Rental do
  before :each do
    @student = Student.new('SS3', 20, 'Stanley', true)
    @book = Book.new('Romeo and Juliet', 'William Shakespeare')
    @rental = Rental.new(@student, @book, '12-12-2015')
  end

  context 'New Object' do
    it 'Create a new Rental object' do
      @rental.should(be_an_instance_of(Rental))
    end

    it 'throws an argument error when parameters are less than or greater than expected' do
      -> { Rental.new 'Stanley' }.should raise_error ArgumentError
    end

    it 'throws an argument error when no parameter is given' do
      -> { Rental.new }.should raise_error ArgumentError
    end
  end

  context 'Object parameters and methods' do
    it 'add book and confirm that book has been added' do
        @second_book = Book.new('Romeo and Juliet', 'William Shakespeare')
        @rental.add_book(@second_book)
        @rental.book.should(be_an_instance_of(Book))
    end

    it 'add person and confirm that person has been added' do
      @second_student = Student.new('SS3', 20, 'Stanley', true)
      @rental.add_person(@second_student)
      @rental.person.should(be_an_instance_of(Student))
    end
  end
end
