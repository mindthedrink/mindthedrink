FactoryGirl.define do
  factory :user do
    email { "email#{SecureRandom.uuid}@example.org" }
    password '1234567890'
    password_confirmation { |u| u.password }


    trait :admin do
      after(:build) { |object| object.roles = [:admin, :user] }
    end

    trait :user do
      after(:build) { |object| object.roles = [:user] }
    end

    trait :guest do
      after(:build) { |object| object.roles = [] }
    end
  end
end
