require_relative '../base_decorator'
require_relative '../person'

describe CapitalizeDecorator do
  before :each do
    @person = Person.new(20, 'stanley')
    @base_person = BaseDecorator.new(@person)
  end

  describe 'check decorated item' do
    it 'creates a new capitalize decorator class' do
      @base_person.should(be_an_instance_of(BaseDecorator))
    end
  end
end
