class Integer
  # Integer#hash already implemented for you

end

class Array
  def hash
    uniq = ""
    self.each_with_index do |el, i|
      uniq += el.to_s + i.to_s
    end

    uniq.to_i
  end
end

class String
  def hash
    alpha = ("a".."z").to_a


    uniq = self.chars.map do |char|
      alpha.index(char).to_s
    end

    uniq.join.to_i

  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash = 0
    self.each do |k,v|
      hash += convert_to_hash(k) + convert_to_hash(v)
    end

    hash
  end

  def convert_to_hash(value)
    alpha = ("a".."z").to_a
    if value.is_a?(Integer)
      return value
    else 
      return alpha.index(value.to_s)
    end
  end
end