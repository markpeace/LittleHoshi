require 'spec_helper'

describe Box do

	it "should create when valid" do
		FactoryGirl.build(:box).should be_valid
	end
	
	describe "It should need a theme, so it " do
		it "should be invalid without one" do
			FactoryGirl.build(:box, theme:nil).should_not be_valid
		end
		it "should be invalid when duplicated" do 
			FactoryGirl.create(:box, theme:"test")
			FactoryGirl.build(:box, theme:"test").should_not be_valid
		end
	end

end
