class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result = 0
    self.each_with_index do |el, idx|
      result += el.hash ** (idx + 1)
    end
    result
  end
end

class String
  def hash
    result = 0
    i = 1
    self.each_byte do |letter|
      result += (letter ** i)
      i += 1
    end
    result
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0
    i = 1
    self.each_pair do |key, value|
      result += (key.hash**i) + (value.hash**i)
    end
    result
  end
end
