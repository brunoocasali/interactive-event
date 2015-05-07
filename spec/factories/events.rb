FactoryGirl.define do
  factory :event do
    hash_tag "##{Forgery(:lorem_ipsum).words(4, at_most: 30)}"
    title { Forgery(:lorem_ipsum).words(10, at_most: 75) }
    image { Forgery(:lorem_ipsum).words 23 }
    start_at { Forgery(:date).date }
    end_at { Forgery(:date).date }

    kind { EventKind.list.sample }

    user
    #
    # factory :event_with_tweets do
    #   after(:create) do |event|
    #     create(:item, event: event, service: create(:service, key: :twitter))
    #   end
    # end
  end

  factory :event_with_tweets, parent: :event do |event|
    items { build_list :tweet_item, 3 }
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
