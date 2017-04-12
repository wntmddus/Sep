require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor
  attr_accessor :list

  def initialize(size)
    @max_load_factor = 0.7
    self.list = Array.new(size)
    for i in 0..self.list.length-1
      self.list[i] = LinkedList.new
    end
  end

  def []=(key, value)
    index = index(key, self.list.length)
    list_piece = self.list[index]
    self.list[index].add_to_tail(Node.new(key, value))
    if load_factor > 0.7
      resize
    end
  end
  def search_key_in_list(list_piece, key)
    while list_piece.head != nil
      if list_piece.head.key == key
        true
        break
      end
      list_piece.head = list_piece.head.next
    end
    false
  end



  def [](key)
    index = index(key, self.list.length)
    list_piece = self.list[index]
    while list_piece.head != nil
      if list_piece.head.key == key
        list_piece.head.value
        break
      end
      list_piece.head = list_piece.head.next
    end
    list_piece.head.value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0
    # generate index with ascii code
    key.each_byte do |c|
      sum += c
    end
    sum % size
  end

  # Calculate the current load factor
  def load_factor
    z = total_item_count / (self.list.length * 1.0)

  end

  # Simple method to return the number of items in the hash
  def total_item_count
    total = 0
    for i in 0..self.list.length-1
      total = total + self.list[i].list_length
    end
    total
  end
  def size
    self.list.length
  end

  # Resize the hash
  def resize
    totalItem = self.total_item_count
    oldItem = self.list
    self.list = Array.new(self.list.length * 2)
    for i in 0..self.list.length-1
      self.list[i] = LinkedList.new
    end
    for i in 0..oldItem.length - 1
      while (oldItem[i].head != nil)
        index = index(oldItem[i].head.key, self.list.length)
        self.list[index].add_to_tail(oldItem[i].head)
        oldItem[i].head = oldItem[i].head.next
      end
    end
  end
end
