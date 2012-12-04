require 'spec_helper'

describe Box do

	it "should create when valid" do
		FactoryGirl.build(:box).should be_valid
	end
	
	
	describe "It should need a theme, so it " do
		it { should validate_presence_of(:theme) }
		it { should validate_uniqueness_of(:theme).case_insensitive }
	end

	it { should have_many(:activities).dependent(:destroy) }
	
	describe "it should have custom methods, so it " do
		it "should provide a cost summary" do
			FactoryGirl.create(:ingredientisation)
			Box.last.cost.to_f.should == 6.66
		end
	end
	
end
