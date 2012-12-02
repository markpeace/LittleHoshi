# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient do
    name "MyString"
    unitcost "9.99"
    stock 1
  end
end
