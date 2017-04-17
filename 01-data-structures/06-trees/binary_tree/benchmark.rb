require 'benchmark'
require_relative 'binary_search_tree'
require_relative 'min_binary_heap'

n = 100000
root = Node.new("a", 1)
b = BinarySearchTree.new(root)
m = MinBinaryHeap.new

Benchmark.bm(7) do |x|
  #x.report("BinarySearchTree insert 100000: ") { for i in 0..n; b.insert(root, Node.new("#{i}", 100000 - i)); end }
  x.report("MinBinaryHeap insert 100000: ") { for i in 0..n; m.insert(Movie.new("#{i}", 100000 - i)); end}
  #x.report("BinarySearchTree find 50000 ") { b.find(root,"500") }
  x.report("MinBinaryHeap find 50000") { m.find("50000") }
  #x.report("BinarySearchTree delete 50000 ") { b.delete(root, "500") }
  x.report("MinBinaryHeap delete 50000 ") { m.delete("50000") }
end
