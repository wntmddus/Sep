class Node
  attr_accessor :name
  attr_accessor :film_actor_hash
  attr_accessor :visited
  def initialize(name)
    self.name = name
    self.film_actor_hash = Hash.new
    self.visited = false
  end

  def insert(key, actor)
    self.film_actor_hash[key].push(actor)
  end

  def find_path(Node find)
    queue = Queue.new
    found = false
    depth = 0
    path = ""
    last_movie_name = ""
    current_movie = ""
    movie_array = []
    parent_array_list = []
    subitem_key_array = []
    parent = self
    queue.enq(parent)
    key_array = self.film_actor_hash.keys
    parent_array_list = []
    orig_parent_array_list = [self]
    while depth != 6 && !found
      item = queue.pop
      if !item.visited
        #subitem_key_array = item.film_actor_hash.keys
        item.film_actor_hash.keys.each do |x|
          if item.film_actor_hash[x].include?(find)
            #found then done
            last_movie_name = x
            found = true
            break
          end
        end
        item.visited = true
        if !found && queue.empty?
          if key_array.length != 0
            #case when Actors in one movie is exhausted
            #loop 1 for fail store first current_movie
            #store all the Actors in movie in Queue
            current_movie = key_array.shift
            if movie_array.length == 0
              movie_array.push(current_movie)
            else
              movie_array.pop
              movie_array.push(current_movie)
            end
            parent.film_actor_hash[current_movie].each do |x|
              #enqueue all the actors in movie
              queue.enq(x)
            end
          elsif key_array.length == 0 # when movie is exhausted in parent node
            #choose another parent node and search through it
            if parent_array_list.length == 0
              # if there are no parent candidate on the list, build new parent_array_list
              parent_array_list = parent_list_builder(orig_parent_array_list)
              orig_parent_array_list = parent_list_builder(orig_parent_array_list)
              depth = depth + 1
            end
            if parent_array_list[0].is_a? String
              current_parent_movie = parent_array_list.shift
            end
            # shift one of parent into parent
            parent = parent_array_list.shift
            #store hash key of current parent in key_array
            key_array = parent.film_actor_hash.keys
          end
        end
        # end of !found && queue.empty?
      end
      # end of !item.visited
    end
    # end of while

  end
  # parent_list is built from orig_parent_array_list
  def parent_list_builder(orig_parent_array_list)
    temp_array = []
    orig_parent_array_list.each do |x|
      if x.class != String
        temp_array = temp_array + x.film_actor_hash.flatten(2)
      else
        temp_array.push(x)
      end
    end
    temp_array
  end
  def update_current_film_path()

  def search_node(Node find_node_at)
  end


end

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
