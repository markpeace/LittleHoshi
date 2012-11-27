# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    box_id 1
    name "MyString"
    notes "MyText"
  end
end
