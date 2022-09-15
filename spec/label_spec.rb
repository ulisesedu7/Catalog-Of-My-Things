require_relative '../methods/label'

describe Label do 
  context "Testing the class book" do
    before :each do 
      @label = Label.new('Awesome', 'Green')
    end

    it '@label should be an instance of the class Label' do
      expect(@label).to be_instance_of Label 
    end
    
    it "The Label's title should be Awesome" do
      expect(@label.title).to eq('Awesome')  
    end

    it "The label's color should be Green" do
      expect(@label.color).to eq('Green') 
    end

    it "The method add_item should be available for the instance @label" do
      expect(@label).to respond_to(:add_item)  
    end
  end
end