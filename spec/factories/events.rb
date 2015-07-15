FactoryGirl.define do
  factory :event do
    hash_tag "##{Forgery(:lorem_ipsum).words(4, at_most: 30)}"
    title { Forgery(:lorem_ipsum).words(10, at_most: 75) }
    cover { Forgery(:lorem_ipsum).words 23 }
    start_at { Forgery(:date).date }
    end_at { Forgery(:date).date }

    kind { EventKind.list.sample }
    services { [ServiceKind.list.sample] }

    user
  end

  factory :invalid_event, parent: :event do
    hash_tag nil
    title nil
    cover nil
    start_at nil
    end_at nil
    kind nil
    services nil

    user nil
  end
end
