# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredientisation, :class => 'Ingredientisations' do
    box_id 1
    ingredient_id 1
    quantity 1
  end
end
