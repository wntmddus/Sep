class MyStack
  attr_accessor :top
  attr_accessor :stack

  def initialize
    self.stack = Array.new
    self.top = nil
  end

  def push(item)
    self.stack[self.stack.length] = item
    self.top = item
  end

  def pop
    item = self.stack.delete_at(self.stack.length-1)
    self.top = self.stack.last
    item
  end

  def empty?
    if self.stack == []
      true
    else
      false
    end
  end
end
