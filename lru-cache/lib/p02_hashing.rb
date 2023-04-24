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
    0
  end
end