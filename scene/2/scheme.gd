extends MarginContainer


@onready var connectors = $Connectors
@onready var modules = $Modules

var member = null


func set_attributes(input_: Dictionary) -> void:
	member = input_.member
	
	custom_minimum_size = Vector2(Global.vec.size.scheme)
	
	for key in Global.arr.scheme:
		var node = get(key+"s")
		node.position = custom_minimum_size * 0.5
	
	init_modules()


func init_modules() -> void:
	var input = {}
	input.scheme = self
	input.position = Vector2()

	var module = Global.scene.module.instantiate()
	modules.add_child(module)
	module.set_attributes(input)
