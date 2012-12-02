require 'spec_helper'

describe Ingredientisation do

	it "should create when valid" do
		FactoryGirl.build(:ingredientisation).should be_valid
	end

	it { should belong_to(:ingredient) }
	it { should validate_presence_of(:ingredient) }	
	
	it { should belong_to(:activity) }
	it { should validate_presence_of(:activity) }
	
end
