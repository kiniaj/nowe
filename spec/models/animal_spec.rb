require 'rails_helper' 
RSpec.describe Animal, type: :model do

	it 'should have :name, :color, :age attributes' do
		expect(subject.attributes).to include('name', 'color', 'age')
	end

	it 'should require name' do
		expect(Animal.new).not_to be_valid
		expect(Animal.new(name: "Reksio")).to be_valid
	end

	it 'should have old scope working properly' do
		@animal1=Animal.create(name: "Reksio", age: 100)
		@animal2=Animal.create(name: "Azor", age: 5)
		expect(Animal.old).to include(@animal1)
		expect(Animal.old).not_to include(@animal2)
	end

	it 'should set friends properly to 0 when created' do
		expect(subject.methods).to include(:zero_friends)
		@animal=Animal.create(name: "Reksio", age: 100)
		expect(@animal.friends).to equal 0
	end

	it "should have many foods" do
		t = Animal.reflect_on_association(:foods)
		expect(t.macro).to equal :has_many
	end

	it "should belong to user" do
		t = Animal.reflect_on_association(:user)
		expect(t.macro).to equal :belongs_to
	end
end