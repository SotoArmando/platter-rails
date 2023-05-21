require 'fatsecret'


class FatsecretSource
    class << self
        def init()
            FatSecret.init(ENV["FATSECRET_CONSUMER_KEY"], ENV["FATSECRET_CONSUMER_SECRET"])
            return FatSecret;
        end
    end
end
