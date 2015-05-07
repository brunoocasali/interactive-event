FactoryGirl.define do
  factory :item do
    id { Forgery('credit_card').number }
    status { ItemStatus.list.sample }
    text { Forgery(:basic).text }
    image_link { Forgery(:lorem_ipsum).words 23 }

    service
    event
  end

  factory :invalid_item, parent: :item do
    status nil
    text nil
    image_link nil

    service nil
    event nil
  end

  factory :tweet_item, parent: :item do
    association :service, factory: :twitter_service
  end
end
