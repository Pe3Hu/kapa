extends MarginContainer


@onready var title = $Title
@onready var stack = $Stack

var rundown = null
var root = null
var branch = null


func set_attributes(input_: Dictionary) -> void:
	rundown = input_.rundown
	root = input_.root
	branch = input_.branch
	
	var input = {}
	input.type = "aspect"
	input.subtype = branch + " " + root
	title.set_attributes(input)
	title.custom_minimum_size = Vector2(Global.vec.size.aspect)
	
	input = {}
	input.type = "number"
	input.subtype = 0
	stack.set_attributes(input)
	stack.custom_minimum_size = Vector2(Global.vec.size.sixteen)

	title.set("theme_override_constants/margin_left", 4)
	title.set("theme_override_constants/margin_top", 4)
	custom_minimum_size = title.custom_minimum_size + stack.custom_minimum_size * 0.75
