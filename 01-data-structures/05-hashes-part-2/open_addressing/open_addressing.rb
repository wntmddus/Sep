require_relative 'node'

class IndexNext
  attr_accessor :next
  attr_accessor :index
  def initialize
    self.next = nil
    self.index = nil
  end
end

class OpenAddressing
  attr_accessor :list
  def initialize(size)
    self.list = Array.new(size)
  end

  def []=(key, value)
    i = IndexNext.new
    node = Node.new(key, value)
    i = index(key, size)
    node.next = i.next
    self.list[i.index] = node
  end

  def [](key)
    for i in 0..self.list.length-1
      if self.list[i] != nil && self.list[i].key == key
        k = i
        break
      end
    end
    self.list[k].value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    i = IndexNext.new
    sum = 0
    i.next = 0
    # generate index with ascii code
    key.each_byte do |c|
      sum += c
    end
    i.index = sum % size
    if self.list[i.index] != nil
      #loop through the next available slot
      i.index = i.index + 1
      #index and number_searched is returned to i
      i = next_open_index(i.index)
    else
      #when empty just return sum % size
      i
    end
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    i = IndexNext.new
    number_searched = 0
    loop do
      if self.list[index] == nil
        #if empty slot is found increase number_searched and exit loop
        number_searched = number_searched + 1
        break
      end
      if number_searched == (size - 1)
        # if all the slot is searched and there is no empty space
        # set number_searched to 0 and resize
        number_searched = 0
        resize
        break
      end
      if index < (self.list.length - 1)
        # if index value is still less than the list.length - 1(last index)
        # increase the index
        index = index + 1
      else
        # if index reached to the list.length - 1(last index)
        # set index to 0
        index = 0
      end
      number_searched = number_searched + 1
    end
    i.index = index
    i.next = number_searched
    i
  end

  # Simple method to return the number of items in the hash
  def size
    self.list.length
  end

  # Resize the hash
  def resize
    oldItem = self.list
    newsize = self.list.length * 2
    self.list = Array.new(newsize)
    for i in 0..oldItem.length - 1
      if(oldItem[i] != nil)
        indexnext = index(oldItem[i].key, size)
        self.list[indexnext.index] = oldItem[i]
        self.list[indexnext.index].next = indexnext.next
      end
    end
  end
end
