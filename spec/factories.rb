FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user#{n}@local.host" }
  end

end
