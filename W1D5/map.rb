class Map
  attr_accessor :map_arr
  def initialize
    @map_arr = []
  end

  def set(key,value)
    keys_arr = keys_arr(self.map_arr)
    if keys_arr.include?(key)
      existing_key_idx = keys_arr.index(key)
      @map_arr[existing_key_idx][1] = value
    else
      self.map_arr << [key, value]
    end
    self.map_arr
  end

  def keys_arr(touples_arr)
    touples_arr.map{|subarr| subarr[0]}
  end

  def get(key)
    self.map_arr.each do |subarr|
      return subarr[1] if subarr[0] == key
    end
  end

  def delete(key)
    self.map_arr.each_with_index do |subarr, idx|
      if subarr[0] == key
        self.map_arr =
        self.map_arr.take(idx) + self.map_arr.drop(idx+1)
      end
    end
    self.map_arr
  end

  def show
    @map_arr
  end
end
