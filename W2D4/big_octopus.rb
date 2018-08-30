#O(n^2)

def sluggish_octopus(fish_arr)
  fish_arr.each_index do |idx1|
    next if idx1 = fish_arr.length - 1
    fish_arr.each_index do |idx2|
      sorted = false
      until sorted
        if fish_arr[idx1].length > fish_arr[idx2].length
          fish_arr[idx1], fish_arr[idx2] = fish_arr[idx2],fish_arr[idx1]
          sorted = false
        end
      end
    end
  end
  fish_arr.last
end

#O(n log n) time

def dominant_octopus(fish_arr, &prc)

  return fish_arr if fish_arr.length <= 1
  prc ||= Proc.new{|a, b| a.length <=> b.length}
  mid = fish_arr.length / 2
  left = fish_arr[0...mid]
  right = fish_arr[mid..-1]

  sorted_left = dominant_octopus(left, &prc)
  sorted_right = dominant_octopus(right, &prc)

  merge(sorted_left, sorted_right, &prc)

end

def merge(left, right, &prc)
  prc ||= Proc.new{|a, b| a.length <=> b.length}
  result = []

  until left.empty? || right.empty?
    if prc.call(left[0], right[0]) == -1
      result << left.shift
    else
      result << right.shift
    end
  end
  result + left + right
end

def give_fish(fish_arr)
  sorted_fish = dominant_octopus(fish_arr)
  sorted_fish.last
end

#O(n)
def clever_octopus(fish_arr)
  fish_arr.reduce do |longest, fish|
    if fish.length > longest.length
      longest = fish
    else
      longest
    end
  end
end

# DANCE_MOVES = ["right-down", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, dance_moves)
  dance_moves.each_with_index do |tile, idx|
    return idx if tile == direction
  end
end

def make_dance_hash(dance_moves)
  result = {}
  dance_moves.each_with_index{|move, idx| result[move] = idx }
  result
end

#dance_hash = make_dance_hash(dance_moves)

# DANCE_HASH = {
#   "up" => 0,
#   "right-up" => 1,
#   "right"=> 2,
#   "right-down" => 3,
#   "down" => 4,
#   "left-down" => 5,
#   "left" => 6,
#   "left-up" => 7
# }

def constant_dance(direction, dance_hash)
  DANCE_HASH[direction]
end
