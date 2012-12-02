require 'spec_helper'

describe Ingredient do
	it "should create when valid" do
		FactoryGirl.build(:ingredient).should be_valid
	end	
	
	it { should have_many(:ingredients).through(:ingredientisation) }

	it { should validate_presence_of(:name) }
	it { should validate_uniqueness_of(:name).case_insensitive }
	it { should validate_presence_of(:unitcost) }
	
	
end
