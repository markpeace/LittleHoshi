# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient do
    name "MyString"
    unitcost "3.33"
    stock 1
  end
end
