require 'spec_helper'

describe Invitation do

  before :each do 
    Invitation.destroy_all
  end

  after :each do
	Invitation.destroy_all
  end

  describe "it works around invititation tokens, so it" do
	it "should require a unique token" do
		FactoryGirl.create(:invitation, token:"mark").should be_valid
		FactoryGirl.build(:invitation, token:"mark").should_not be_valid
	end
    it "should automatically generate a unique token if one isn't given" do
      i=FactoryGirl.create(:invitation, token:nil)
	  i.should be_valid
      i.token.should_not be_nil
    end
  end

  describe "it should enable the generation of invitation tokens, so it" do

	describe "should enable invitation of specific people" do
	    it "should allow you to invite a specific email address" do
			Invitation.to_user("junker.junk@junkerjunkjunk.com")
			Invitation.count.should equal(1)
			Invitation.first.notes.should eq("for junker.junk@junkerjunkjunk.com")
		end
		it "should send an email when people have been invited" do
			Invitation.to_user("junker.junk@junkerjunkjunk.com")
			ActionMailer::Base.deliveries.last.to.should == ["junker.junk@junkerjunkjunk.com"]
			ActionMailer::Base.deliveries.last.subject.should == "You have been invited to join Little Hoshi"
		end
		it "shouldn't create a registration of interest if an email is already logged" do 
			u=FactoryGirl.create(:user, invitation_token:nil, email:"junker.junk@junkerjunkjunk.com")
			Invitation.to_user("junker.junk@junkerjunkjunk.com")
			User.count.should equal(1)
		end
		it "should create a registration of interest if an email address isn't already logged" do 
			Invitation.to_user("junker.junk@junkerjunkjunk.com")
			User.count.should equal(1)		
		end
	end
	it "should allow you to bulk invite x users from the waiting list" do
	
		(1..10).each { FactoryGirl.create(:user, invitation_token:nil) }	
		
		Invitation.to_users(10)
		Invitation.count.should equal(10)
    end
  end

  describe "It should track the number of times a token has been used, so it" do
	it "should have one default use" do
		i=Invitation.create
		i.uses.should equal(1)
	end
  	it "should automatically decrease a token when it is used" do
		i=FactoryGirl.create(:invitation, uses:2)
		i.uses.should equal(2)
		i=Invitation.consume(i.token)
		i.uses.should equal(1)
	end 
	it "should delete tokens which reach 0 uses left" do
		i=FactoryGirl.create(:invitation, uses:1)
		i.uses.should equal(1)
		i=Invitation.consume(i.token)
		Invitation.count.should equal(0)
	end
  end
end
