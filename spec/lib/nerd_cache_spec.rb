require 'pry'
require_relative '../../lib/nerd_cache'

describe NerdCache do
  let(:redis) { double('Redis') }
  let(:nerds) { 'some nerds' }
  let(:today) { Date.new(2013, 01, 01) }

  describe '#cache' do
    let(:repository) { NerdCache.new(nerds, redis: redis, today: today) }

    it 'does nothing if the cache is not expired' do
      redis.stub(get: Date.new(2013, 01, 02))
      repository.should_not_receive(:reset_cache)

      repository.cache
    end

    it 'resets the cache if the cache is expired' do
      redis.stub(get: Date.new(2013, 01, 01))
      repository.should_receive(:reset_cache)

      repository.cache
    end

    it 'resets the cache if the force option is on' do
      redis.stub(get: Date.new(2013, 01, 02))
      repository.should_receive(:reset_cache)

      repository.cache(force: true)
    end

    it 'resets the cache if there is no existing cache' do
      redis.stub(get: nil)
      repository.should_receive(:reset_cache)

      repository.cache(force: true)
    end
  end
end
