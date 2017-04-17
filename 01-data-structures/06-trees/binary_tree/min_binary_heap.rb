class MinBinaryHeap
  attr_accessor :heap

  def initialize
    self.heap = [nil]
  end

  def insert(data)
    if self.heap.size == 0
      self.heap.push(data)
    else
      self.heap.push(data)     #[0  ,1,2,3,4,5,6,7,8, 9,10]
      sort(self.heap.size - 1) #[nil,2,3,4,5,6,7,8,9,10,11]
    end
  end
  def sort(root_index)
    if root_index == 1
      return
    elsif self.heap[root_index].rating < self.heap[root_index / 2].rating
      temp = self.heap[root_index]
      self.heap[root_index] = self.heap[root_index / 2]
      self.heap[root_index / 2] = temp
      sort(root_index / 2)
    end
  end

  def delete(data)
    self.heap.delete_if {|x|
      if x != nil
        x.title == data
      end
    }
    sort(self.heap.size - 1)
  end
  def find(data)
    result = 0
    for i in 1..self.heap.size - 1
      if self.heap[i].title == data
        result = self.heap[i]
        break
      end
    end
    result
  end
  def print
    self.heap.each do |x|
      if x != nil
        puts "#{x.title}: #{x.rating}\n"
      end
    end
  end
end
class Movie
  attr_accessor :title, :rating
  def initialize(title, rating)
    self.title = title
    self.rating = rating
  end
end
