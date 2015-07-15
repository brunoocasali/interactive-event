FactoryGirl.define do
  factory :author do
    id { rand(1..9999) }
    avatar { Forgery(:internet).domain_name }
    name { Forgery(:name).full_name }
    screen_name { Forgery(:name).full_name.underscore }
    profile_url { Forgery(:internet).domain_name }

    service { ServiceKind.list.sample }
  end
end
