FactoryGirl.define do
  factory :item do
    id { Forgery('credit_card').number }
    text { Forgery(:basic).text }
    image_link { Forgery(:internet).domain_name }

    status { ItemStatus.list.sample }
    service { ServiceKind.list.sample }

    event
    author
  end

  factory :invalid_item, parent: :item do
    id nil
    text nil
    image_link nil

    status nil
    service nil

    event nil
  end
end
