extends MarginContainer


@onready var rundown = $HBox/Rundown
@onready var scheme = $HBox/Scheme

var guild = null


func set_attributes(input_: Dictionary) -> void:
	guild = input_.guild
	
	var input = {}
	input.member = self
	rundown.set_attributes(input)
	scheme.set_attributes(input)
