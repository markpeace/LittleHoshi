require 'spec_helper'

describe User do
	
	describe "It should create a user, so it" do
		before :each do
			@i=FactoryGirl.create(:invitation, uses:2)
			@u=FactoryGirl.create(:user, invitation_token:@i.token)
		end
		it "should create when valid" do
			@u.should be_valid
			@u.registration_of_interest.should be_false
		end
		it "should consume a token" do
			Invitation.last.uses.should eq(1)
		end
		it "should send a confirmation email" do
			ActionMailer::Base.deliveries.last.to.should == [@u.email]
			ActionMailer::Base.deliveries.last.subject.should == "Welcome to Little Hoshi"
		end
	end
	
	describe "It uses a invitation token for full registration, so it" do
		it "should create a registration of interest if one isn't provided" do
			u=FactoryGirl.create(:user, invitation_token:nil)
			u.should be_valid
			u.registration_of_interest.should be_true
		end
		it "should send a holding email" do
			u=FactoryGirl.create(:user, invitation_token:nil)
			ActionMailer::Base.deliveries.last.to.should == [u.email]
			ActionMailer::Base.deliveries.last.subject.should == "You will be invited to join Little Hoshi soon..."
		end

		it "should raise an error if the token is invalid" do
			FactoryGirl.build(:user, invitation_token:"wrong").should_not be_valid
		end
	end 

	describe "requires an email address, so it" do
		it "should raise an error when not provided" do
			FactoryGirl.build(:user, email:nil).should_not be_valid
		end
		it "should raise an error when invalid" do
			FactoryGirl.build(:user, email:"markpeace.com").should_not be_valid
		end
		it "should replace an existing registration of interest" do
			FactoryGirl.create(:user, invitation_token:nil)
			u=User.last
			FactoryGirl.build(:user, invitation_token:nil, email:u.email).should be_valid
			FactoryGirl.create(:user, invitation_token:nil, email:u.email)
			User.count.should eq(1)
		end
		it "should raise an error if the email exists in a full registration" do
			FactoryGirl.create(:user).should be_valid
			FactoryGirl.build(:user, email:User.last.email).should_not be_valid
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
	
	describe "it should consume a token"
	
	describe "it should resume a registration on the basis of a registration of interest"
	
	describe "is the basis for authentication so it" do
		before(:each) do 
			@u=FactoryGirl.create(:user)
		end
		
		it "should allow login for correct username and password" do
			User.authenticate(@u.email, @u.password).should_not be_nil
		end
		it "should return an error when email is not found" do
			User.authenticate("wrong email", @u.password).should be_nil
		end
		it "should return an error when username and password do not match" do
			User.authenticate(@u.email, "wrong password").should be_nil
		end
		it "should return an error when a user tries to log in to a registration of interest" do
			@u.registration_of_interest=true
			@u.save
			User.authenticate(@u.email, @u.password).should be_nil
		end
	end

end
