require_relative '../methods/author'

describe Author do
  context 'created' do
    first_name = 'John'
    last_name = 'Doe'

    before(:each) do
      @author = Author.new(first_name, last_name)
    end
    it 'should have a first name' do
      expect(@author.first_name).to eq(first_name)
    end
    it 'should have a last name' do
      expect(@author.last_name).to eq(last_name)
    end
    it '@author should be an instance of Author' do
      expect(@author).to be_an_instance_of(Author)
    end
    it 'should throw an error if no first_name is given' do
      expect { Author.new(last_name) }.to raise_error(ArgumentError)
    end
  end
end
