class Stack
  attr_accessor :ivar

  def initialize
    @ivar = []
  end

  def push(el)
    self.ivar << el
  end

  def pop
    self.ivar.pop
    self.ivar
  end

  def peek
    self.ivar.last
  end
end
