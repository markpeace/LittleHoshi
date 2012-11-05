require 'spec_helper'

describe User do

	it "should create when valid" do
		FactoryGirl.build(:user).should be_valid
	end

	describe "requires an email address, so it" do
		it "should raise an error when not provided" do
			FactoryGirl.build(:user, email:nil).should_not be_valid
		end
		it "should raise an error when invalid" do
			FactoryGirl.build(:user, email:"markpeace.com").should_not be_valid
		end
		it "should raise an error when duplicated" do
			FactoryGirl.create(:user).should be_valid
			FactoryGirl.build(:user).should_not be_valid
		end
	end
	
	describe "requires a password so it" do
		it "should raise an error when it doesnt have one" do 
			FactoryGirl.build(:user, password:nil).should_not be_valid
		end
		it "should raise an error when too long or too short" do
			FactoryGirl.build(:user, password:"s", password_confirmation:"s").should_not be_valid
			FactoryGirl.build(:user, password:"thispasswordisfartoolong", password_confirmation:"thispasswordisfartoolong").should_not be_valid
		end
		it "should raise an error when password and confirmation dont match" do 
			FactoryGirl.build(:user, password:"password1", password_confirmation:"password2").should_not be_valid
		end
	end
	
	describe "is the basis for authentication so it" do
		it "should allow login for correct username and password"
		it "should return an error when username is not found"
		it "should return an error when username and password do not match"
	end

end
