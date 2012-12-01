require 'spec_helper'

describe Activity do

	it "should create when valid" do
		FactoryGirl.build(:activity).should be_valid 
	end

	it { should belong_to(:box).dependent(:destroy) }
	it { should validate_presence_of(:name).case_insensitive() }
	it { should validate_uniqueness_of(:name).scope_to(:box_id) }	

end
