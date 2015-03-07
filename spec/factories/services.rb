FactoryGirl.define do
  factory :service do
    name { Forgery(:lorem_ipsum).words 2 }
  end
end
