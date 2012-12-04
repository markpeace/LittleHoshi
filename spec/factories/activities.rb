# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :activity do
    association :box_id, :factory=>:box
    name "MyString"
    notes "MyText"
  end

end
