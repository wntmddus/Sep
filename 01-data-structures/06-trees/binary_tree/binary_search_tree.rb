require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root)
    self.root = root
  end

  def insert(root, node)
    if self.root == nil
      self.root = node
    end
    if root.rating > node.rating
      if root.left != nil
        insert(root.left, node)
      else
        root.left = node
        node.parent = root
      end
    elsif root.rating <= node.rating
      if root.right != nil
        insert(root.right, node)
      else
        root.right = node
        node.parent = root
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root == nil
      return nil
    elsif root.title == data
      return root
    end
    node = find(root.left, data)
    if node == nil
      node = find(root.right, data)
    end
    node
  end

  def delete(root, data)
    node1 = node = self.find(root, data)
    if data == nil
      return nil
    end
    if node1.left == nil && node1.right == nil
      node1 = node1.parent
      if node == node1.left
        node1.left = nil
      else
        node1.right = nil
      end
    end
    if node1.left != nil
      node1 = node1.left
      while node1.right != nil
        node1 = node1.right
      end
      node.title = node1.title
      node.rating = node1.rating
      node1 = node1.parent
      node1.right = nil
    elsif node1.left == nil && node1.right != nil
      node1 = node1.right
      while node1.left != nil
        node1 = node1.left
      end
      node.title = node1.title
      node.rating = node1.rating
      node1 = node1.parent
      node1.left = nil
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    string = ""
    q = Queue.new
    if children == nil
      q.enq(root)
    else
      q.enq(children)
    end
    while q.size > 0
      n = q.pop
      if n != nil
        string = string + n.title + ": #{n.rating}\n"
        if n.left != nil
          q.enq(n.left)
        end
        if n.right != nil
          q.enq(n.right)
        end
      end
    end
    puts string
  end
end
