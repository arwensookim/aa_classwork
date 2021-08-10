class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    # [1, 2, 3].hash == [3, 2, 1].hash # => false
    hash = 0
    self.each_with_index do |el, i|
      hash = hash ^ (el.hash & i.hash)
    end
    hash
  end
end

class String
  def hash
    hash = 0
    self.each_char.with_index do |c, i|
      hash = hash ^ (c.ord.hash & i.hash)
    end
    hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def Hash
    hash = 0
    self.each do |k, v|
      hash = hash ^ (k.hash & v.hash)
    end
    hash
  end
end
