require_relative '../methods/book'

describe Book do
  context 'Testing the class book' do
    before :each do
      @book = Book.new('2201-12-11', 'Best', 'Good', 'Narnia')
    end

    it '@book should be an instance of the class Book' do
      expect(@book).to be_instance_of Book
    end

    it "The book's title should be Narnia" do
      expect(@book.title).to eq('Narnia')
    end

    it "The book's publisher should be Best" do
      expect(@book.publisher).to eq('Best')
    end

    it 'The method can_be_archived should be available for the instance @book' do
      expect(@book).to respond_to(:can_be_archived?)
    end
  end
end
