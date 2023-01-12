require_relative './../book'
require_relative './../rental'
require_relative './../student'

describe Student do
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
end
