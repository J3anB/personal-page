redis = Redis.new(:url => ENV.fetch("REDISTOGO_URL"))
  redis.del("rooms")

