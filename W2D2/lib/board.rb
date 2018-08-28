class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14){[]}
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, idx|
      next if idx == 6 || idx ==13
      4.times{ cup << :"stone"}
    end
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    mid = (@cups.length) / 2
    invalids = [mid, @cups.length- 1]
    if start_pos > @cups.length || invalids.include?(start_pos)
      raise "Invalid starting cup"
    elsif @cups[start_pos].empty?
      raise "Starting cup is empty"
    end

  end

  def make_move(start_pos, current_player_name)
    num_of_stones = @cups[start_pos].length
    @cups[start_pos] = []
    (start_pos+1..start_pos + num_of_stones).each do |cup_idx|
      # if current_player_name.side == 1
      #   play_cups = (0...6).to_a
      # else
      #   play_cups = (7...13).to_a
      # end
      # unless play_cups.include?(cup_idx)
        @cups[cup_idx] << :stone
      #end
    end

    if @cups[start_pos + num_of_stones].length == 1
      next_turn(@cups[start_pos + num_of_stones])
    end
    render
    # next_turn
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    mid = @cups.length / 2
    # p mid
    # p @cups
    # p @cups[0..mid-2]
    # p @cups[0..mid].flatten
    if @cups[0..mid-2].flatten.empty? || @cups[mid+1 .. -2].flatten.empty?
      return true
    end
    false
  end

  def winner
  end
end
