class MyQueue
  attr_accessor :head
  attr_accessor :tail
  attr_accessor :queue
# can I only use self.queue when I have it declared it as attr_accessor :queue?
#
  def initialize
    self.queue = []
    self.head = self.queue[0]
    self.tail = self.queue[0]
  end

  def enqueue(element)
    self.queue[self.queue.length] = element
    self.head = self.queue.last
    self.tail = self.queue.first

  end

  def dequeue
    self.queue.delete_at(0)
    self.head = self.queue.last
    self.tail = self.queue.first
  end

  def empty?
    if self.queue == []
      true
    else
      false
    end
  end
end
