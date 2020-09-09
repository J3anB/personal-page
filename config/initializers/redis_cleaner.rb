redis = Redis.new(ENV.fetch("REDISTOGO_URL"))
  redis.del("rooms")

