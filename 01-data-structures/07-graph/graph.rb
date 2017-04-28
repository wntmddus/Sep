require_relative 'node'
kevin_bacon = Node.new("Kevin Bacon")
one = Node.new("One")
two = Node.new("two")
three = Node.new("three")
four = Node.new("four")
five = Node.new("five")
six = Node.new("six")
seven = Node.new("seven")
eight = Node.new("eight")
kevin_bacon.find_path(six)


kevin_bacon.film_actor_hash["harry"] = [one, two]
kevin_bacon.film_actor_hash["potter"] = [one, three]
kevin_bacon.film_actor_hash["matrix"] = [one, four]
one.film_actor_hash["harry"] = [two, kevin_bacon]
one.film_actor_hash["potter"] = [three, kevin_bacon]
one.film_actor_hash["matrix"] = [four, kevin_bacon]
one.film_actor_hash["tekken"] = [four, five]
two.film_actor_hash["harry"] = [one, kevin_bacon]
two.film_actor_hash["kimchee"] = [five, six]
two.film_actor_hash["cheese"] = [seven, five]
three.film_actor_hash["potter"] = [kevin_bacon, one]
three.film_actor_hash["naver"] = [four, seven]
three.film_actor_hash["ever"] = [six, eight]
four.film_actor_hash["matrix"] = [kevin_bacon, one]
four.film_actor_hash["tekken"] = [five, one]
four.film_actor_hash["naver"] = [three, seven]
four.film_actor_hash["king"] = [six, seven]
five.film_actor_hash["tekken"] = [one, four]
five.film_actor_hash["kimchee"] = [two, six]
five.film_actor_hash["give"] = [six, eight]
five.film_actor_hash["slave"] = [seven, eight]
six.film_actor_hash["kimchee"] = [two, five]
six.film_actor_hash["king"] = [four, seven]
six.film_actor_hash["give"] = [five, eight]
six.film_actor_hash["happy"] = [seven, eight]
six.film_actor_hash["ever"] = [three, eight]
seven.film_actor_hash["cheese"] = [two, five]
seven.film_actor_hash["king"] = [four, six]
seven.film_actor_hash["slave"] = [five, eight]
seven.film_actor_hash["naver"] = [three, four]
eight.film_actor_hash["ever"] = [three, six]
eight.film_actor_hash["give"] = [six, five]
eight.film_actor_hash["happy"] = [six, seven]
eight.film_actor_hash["slave"] = [five, seven]
