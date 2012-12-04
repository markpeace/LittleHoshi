# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredientisation do
    association :activity_id, :factory=>:activity
    association :ingredient_id, :factory=>:ingredient
    quantity 2
  end
end
