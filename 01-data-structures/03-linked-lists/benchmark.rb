require 'benchmark'
require_relative 'linked_list'

n = 10000
arr = Array.new
l = LinkedList.new
arr1 = Array.new

Benchmark.bm(7) do |x|
  x.report("array: ") { for i in 0..n; arr[i] = i; end }
  x.report("linked_list: ") { for i in 0..n; l.add_to_front(arr1[i] = Node.new(i)); end}
  x.report("array_search_5000: ") { arr[5000] }
  x.report("linked_list_search_5000: ") { l.search_index(5000) }
  x.report("array_remove_5000: ") { arr.delete_at(5000) }
  x.report("linked_list_remove_5000: ") { l.delete(arr1[5000]) }
end
