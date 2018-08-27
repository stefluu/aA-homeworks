class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over == true
      self.take_turn
    end

    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    input = self.require_sequence
    self.round_success_message(input)
    @sequence_length += 1
  end

  def show_sequence
    @seq.each{|color| puts color}
    self.add_random_color
  end

  def require_sequence
    puts "Enter the sequence. (Ex: red, red, yellow, blue)"
    input = gets.chomp
  end

  def add_random_color
    new_color = COLORS.sample
    @seq << new_color
    puts new_color
  end

  def round_success_message(input)
    the_seq = @seq.join(", ")
    the_seq = the_seq[0..-3]
    if input == the_seq
      puts "You got it! Go to the next round!"
    end
  end

  def game_over_message
    puts "You lost! Try again!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
