
FactoryGirl.define do
  factory :picture, :class => Refinery::Pictures::Picture do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

