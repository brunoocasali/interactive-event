FactoryGirl.define do
  factory :service do
    name { Forgery(:lorem_ipsum).words 2 }
  end

  factory :invalid_service, parent: :service do
    name nil
  end
end
