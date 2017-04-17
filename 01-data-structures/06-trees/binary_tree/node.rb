class Node
  attr_accessor :title
  attr_accessor :rating
  attr_accessor :left
  attr_accessor :right
  attr_accessor :parent

  def initialize(title, rating)
    self.title = title
    self.rating = rating
    self.left = nil
    self.right = nil
    self.parent = nil
  end
end
