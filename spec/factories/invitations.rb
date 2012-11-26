# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invitation do
    uses 1
    notes "This is a test invitation"
  end
end
