extends MarginContainer


@onready var cradle = $Cradle
@onready var maze = $Maze

var serifs = []


func _ready() -> void:
	var input = {}
	input.sketch = self
	cradle.set_attributes(input)
	maze.set_attributes(input)


func add_serif() -> void:
	var serif = Time.get_unix_time_from_system()
	serifs.append(serif)


func print_serifs() -> void:
	for _i in serifs.size() - 1:
		print([serifs[_i+1] - serifs[_i]])
