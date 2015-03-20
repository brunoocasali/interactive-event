FactoryGirl.define do
  factory :item do
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
end
