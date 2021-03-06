FactoryGirl.define do
  factory :role do
    name { Forgery(:lorem_ipsum).words 1 }
    description { Forgery(:lorem_ipsum).words 10 }
    key { Forgery(:lorem_ipsum).words 1 }
  end

  factory :invalid_role, parent: :role do
    name nil
    description nil
    key nil
  end
end
