class ServiceKind < EnumerateIt::Base
  # TODO: Uncomment and organize when create the methods at services/search/base.rb
  associate_values twitter: 3 # , facebook: 1, instagram: 2

  # Will generate a instance method like `@item.service_spawn.to_s`
  class Twitter
    def to_s
      ItemSpawn.t(ItemSpawn::TWEET)
    end
  end
end
