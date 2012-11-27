# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :box do
    sequence(:theme) {|n| "theme#{n}"}
	notes	"these are some notes" 
  end
end
