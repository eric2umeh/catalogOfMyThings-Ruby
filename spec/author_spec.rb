require_relative '../author.rb'

describe Author do

    before :each do
        @author = Author.new("Ermiyas", "Demsew")
    end
    
    it "should be an instance of Author class" do
        expect(@author).to be_an_instance_of(Author)
    end

    it "Should return the correct value for the first_name attribute" do
        expect(@author.first_name).to eq("Ermiyas")
    end

    it "Should return the correct value for the last_name attribute" do
        expect(@author.last_name).to eq("Demsew")
    end
    
end