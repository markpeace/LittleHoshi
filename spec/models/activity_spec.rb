require 'spec_helper'

describe Activity do

	it "should create when valid" do
		FactoryGirl.build(:activity).should be_valid 
	end
	
	it { should have_many(:ingredientisations).dependent(:destroy) }
	it { should have_many(:ingredients).through(:ingredientisations) }
	
	it { should belong_to(:box) }
	it { should validate_presence_of(:box) }	
	it { should validate_presence_of(:name) }
	it { should validate_uniqueness_of(:name).scoped_to(:box_id).case_insensitive }	
	
	describe "it should have custom methods, so it " do
		it "should provide a cost summary" do
			Activity.destroy_all
			FactoryGirl.create(:ingredientisation)
			Activity.last.cost.to_f.should == 6.66
		end
	end

end
