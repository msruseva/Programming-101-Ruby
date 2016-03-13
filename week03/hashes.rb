class Hash

  def pick(*keys)
    hash = {}

    each do |key, value|
      hash[key] = value if keys.include? key
    end

    hash
  end

  def pick2(*keys)
    # tap - return hesh, as we change it in the block
    Hash.new.tap do |h|
      each do |k, v|
        h[k] = v if keys.include? k
      end
    end
  end

  def except(*keys)
    hash = {}

    each do |key, value|
      hash[key] = value if !keys.include? key
    end

    hash
  end

  def compact_values
    select { |key, value| value }
  end

  def defaults(hash)
    new_hash = {}

    hash.each do |k, v|
      self.each do |key, value|
        if !self.include? k
          new_hash[k] = v
        else
          new_hash[key] = value
        end
      end
    end

    new_hash
  end

  def defaults2(hash)
    self.merge(hash) { |key, value1, value2| value1 }
  end
end
