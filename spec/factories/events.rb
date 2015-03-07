FactoryGirl.define do
  factory :event do
    hash_tag { "##{Forgery(:basic).text}" }
    title { Forgery(:lorem_ipsum).words 10 }
    image { Forgery(:lorem_ipsum).words 23 }
    start_at { Forgery(:date).date }
    end_at { Forgery(:date).date }
    kind { EventKind.list.sample }

    association :user
  end

  factory :invalid_event, parent: :event do
    hash_tag nil
    title nil
    image nil
    start_at nil
    end_at nil
    kind nil

    user nil
  end
end
