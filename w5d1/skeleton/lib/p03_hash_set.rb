class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return nil if include?(key)
    if count >= @store.length
      resize!
    end
    self[key] << key
    @count += 1
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    return nil unless include?(key)
    self[key].delete(key)
    @count -= 1
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    return @store[num.hash % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0
    old_store = @store
    @store = Array.new(old_store.length * 2) {Array.new}
    old_store.each do |bucket|
      bucket.each do |val|
        insert(val)
      end
    end
  end
end
