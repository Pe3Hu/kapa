extends MarginContainer


@onready var aspects = $Aspects

var member = null


func set_attributes(input_: Dictionary) -> void:
	member = input_.member
	
	init_aspects()


func init_aspects() -> void:
	for branch in Global.arr.branch:
		for root in Global.arr.root:
				var input = {}
				input.rundown = self
				input.root = root
				input.branch = branch
			
				var aspect = Global.scene.aspect.instantiate()
				aspects.add_child(aspect)
				aspect.set_attributes(input)
	
	spread_aspects()


func spread_aspects() -> void:
	var options = []
	var total = Global.arr.root.size() * Global.arr.branch.size() * Global.num.aspect.avg
	
	for branch in Global.arr.branch:
		for root in Global.arr.root:
			var aspect = get_aspect_based_on_root_and_branch(root, branch)
			Global.rng.randomize()
			var random = Global.rng.randi_range(Global.num.aspect.min, Global.num.aspect.avg)
			aspect.stack.set_number(random)
			total -= random
			options.append(aspect)
	
	while total > 0 and !options.is_empty():
		var aspect = options.pick_random()
		Global.rng.randomize()
		var random = Global.rng.randi_range(aspect.stack.get_number() + 1, Global.num.aspect.max)
		aspect.stack.set_number(random)
		total -= random
		
		if random == Global.num.aspect.max:
			options.erase(aspect)


func get_aspect_based_on_root_and_branch(root_: String, branch_: String) -> MarginContainer:
	var a = Global.arr.root.find(root_)
	var b = Global.arr.branch.find(branch_)
	var index = b * Global.arr.root.size() + a
	return aspects.get_child(index)
