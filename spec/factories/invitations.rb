# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invitation do
    token "MyString"
    count 1
    notes "MyString"
  end
end
