FactoryGirl.define do
  factory :item do
    status { ItemStatus.list.sample }
    text { Forgery(:basic).text }
    image_link { Forgery(:lorem_ipsum).words 23 }

    association :service
    association :event
  end
end
