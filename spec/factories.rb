FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email@example#{n}.com" }
    password "hunter2"
  end


  factory :item do

  end


  factory :admin, class: User do
    email "admin@example.com"
    password "password"
    admin true
  end


  factory :shop do
    name "User Shop"
    description "my awesome shop"
    location "my town"
    user
  end


end
