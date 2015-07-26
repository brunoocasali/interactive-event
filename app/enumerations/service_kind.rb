class ServiceKind < EnumerateIt::Base
  # TODO: Uncomment and organize when create the methods at services/search/base.rb
  associate_values twitter: 3, instagram: 2 #, facebook: 1

  # Will generate a instance method like `@item.service_spawn.to_s`
  class Twitter
    def to_s
      ItemSpawn.t(ItemSpawn::TWEET)
    end
  end

  class Instagram
    def to_s
      ItemSpawn.t(ItemSpawn::MEDIA)
    end
  end
end
