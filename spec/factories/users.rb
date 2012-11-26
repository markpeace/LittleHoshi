# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do 
	#association :invitation_token, :factory=>:invitation
	invitation_token Invitation.create.token rescue nil
    sequence(:email) {|n| "junkyjunkjunk#{n}@junkyjunkjunk.com" }
    password "password"
	password_confirmation "password"
  end
end
