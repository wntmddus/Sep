require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail


  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if self.head == nil && self.tail == nil
      self.tail = node
      self.head = node
    else
      self.tail.next = node
      self.tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if self.head == self.tail
      self.head = nil
      self.tail = nil
    else
      temp = self.head
      while temp.next.next != nil
        temp = temp.next
      end
      self.tail = temp
      self.tail.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    temp = self.head
    while temp != nil
      puts "#{temp.data}\n"
      temp = temp.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    temp = self.head
    if temp == node
      remove_front
    elsif self.tail == node
      remove_tail
    else
      while temp.next != node
        temp = temp.next
      end
      temp.next = temp.next.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if self.head == nil && self.tail == nil
      self.head = node
      self.tail = node
    else
      node.next = self.head
      self.head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if self.head == nil && self.tail == nil
    else
      temp = self.head
      self.head = self.head.next
      temp.next = nil
    end
  end
end
