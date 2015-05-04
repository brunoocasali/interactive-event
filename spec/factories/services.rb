FactoryGirl.define do
  factory :service do
    name { %w(Twitter Facebook Instagram).sample }
    key { %w(twitter facebook instagram).sample.to_sym }
  end

  factory :invalid_service, parent: :service do
    name nil
    key nil
  end
end
