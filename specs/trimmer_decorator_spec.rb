require_relative '../capitalize_decorator'
require_relative '../person'

describe TrimmerDecorator do
  before :each do
    @person = Person.new(20, 'Wolfeschlegelsteinhausenbergerdorff')
    @trimmed_person = TrimmerDecorator.new(@person)
  end

  describe 'check decorated item' do
    it 'creates a new capitalize decorator class' do
      @trimmed_person.should(be_an_instance_of(TrimmerDecorator))
    end
  end

  describe 'tests methods in this class' do
    it 'capitalizes the first letter of the name' do
      expect(@trimmed_person.correct_name).to eql 'Wolfeschle'
    end
  end
end
