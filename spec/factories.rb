FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "foo#{n}@example.com" }
    password "secret"
  end

  factory :bookmark do
  end
end
