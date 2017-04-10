require_relative 'hash_item'
class HashClass
  attr_accessor :items
  def initialize(length)
    self.items = Array.new(length)
  end

  def []=(key, value)
    hash = HashItem.new(key, value)
    index = index(key, size)
    if self.items[index] != nil
      #when spot at index is taken
      if self.items[index].key != key
        #different key but same index
        resize
        self.items[index(key, size)] = hash
      elsif self.items[index].key == key && self.items[index].value != value
        resize
        self.items[index(key, size)].value = value
      else
        #same key same index
      end

    else
      #spot at index is not taken
      self.items[index] = hash
    end
  end


  def [](key)
    index = index(key, size)
    self.items[index].value
  end

  def resize
    oldItem = self.items
    newsize = (self.items.length * 2)
    self.items = Array.new(newsize)
    for i in 0..oldItem.length-1
      if(oldItem[i] != nil)
        self.items[index(oldItem[i].key, size)] = oldItem[i]
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0
    key.each_byte do |c|
      sum += c
    end
    if self.items[sum % size] != nil && (self.items[sum % size].key != key)
      resize
      sum % size
    else
      sum % size
    end
  end

  # Simple method to return the number of items in the hash
  def sizeitem
    items.count {|x| x != nil }
  end

  def size
    self.items.length
  end
  alias assign :[]=

end
