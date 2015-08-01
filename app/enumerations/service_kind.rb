class ServiceKind < EnumerateIt::Base
  associate_values instagram: 2, twitter: 3

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
