class NerdCache
  attr_reader :today, :nerds, :redis

  def self.cache(nerds, force: false)
    new(nerds).cache(force: force)
  end

  def initialize(nerds, redis: nil, today: nil)
    @nerds = nerds
    @redis = redis || REDIS
    @today = today || Date.today
  end

  def cache(force: false)
    return unless force || cache_expired?

    reset_cache
  end

  private

  NERD_LIST_KEY = "nerd-list"
  TIMESTAMP_KEY = "nerd-list-timestamp"

  def cache_expired?
    timestamp = redis.get(TIMESTAMP_KEY)
    return true if timestamp.nil?

    today == timestamp
  end

  def reset_cache
    redis.set(TIMESTAMP_KEY, Date.today)
    redis.set(NERD_LIST_KEY, nerds)
  end
end
