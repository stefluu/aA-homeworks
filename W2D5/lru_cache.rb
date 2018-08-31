
class LRUCache
  attr_reader :size
  attr_accessor :cache

  def initialize(size)
    @cache = Array.new
    @size = size
  end

  def count
    # returns number of elements currently in cache
    @cache.count
  end

  def add(el)
    # adds element to cache according to LRU principle
    @cache << el

    if @cache.count(el) == 2
      included_idx = @cache.index(el)
      if included_idx == 0
        @cache = @cache[1..-1]
      else
        @cache =
        @cache[0...included_idx] + @cache[included_idx+1..-1]
      end
    end

    if @cache.count == 5
      @cache = @cache[1..-1]
    end
  end

  def show
    # shows the items in the cache, with the LRU item first
    print @cache
  end

  private
  # helper methods go here!
  def chop_first(arr)
    arr = arr[1..-1]
  end
end
