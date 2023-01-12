require_relative '../capitalize_decorator'
require_relative '../person'

describe CapitalizeDecorator do
  before :each do
    @person = Person.new(20, 'stanley')
    @capitalize_person = CapitalizeDecorator.new(@person)
  end

  describe 'check decorated item' do
    it 'creates a new capitalize decorator class' do
      @capitalize_person.should(be_an_instance_of(CapitalizeDecorator))
    end
  end

  describe 'tests methods in this class' do
    it 'capitalizes the first letter of the name' do
      expect(@capitalize_person.correct_name).to eql 'Stanley'
    end
  end
end
