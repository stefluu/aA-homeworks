class Queue
  attr_accessor :line

  def initialize
    @line = []
  end

  def enqueue(el)
    self.line << el
  end

  def dequeue
    self.line.shift
    self.line
  end

  def peek
    self.line[0]
  end
end
