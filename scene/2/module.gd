extends Area2D


@onready var cp2d = $CollisionPolygon2D
@onready var p2d = $Polygon2D


var tree = null


func set_attributes(input_: Dictionary) -> void:
	tree = input_.tree
	position = input_.position
	
	init_vertexs()


func init_vertexs() -> void:
	var n = 4
	var vertexs = []
	var angle = PI * 2 / n
	
	for _i in n:
		var vertex = Vector2.from_angle(angle * _i) * Global.num.module.r
		vertexs.append(vertex)
	
	cp2d.set_polygon(vertexs)
	p2d.set_polygon(vertexs)
	p2d.set_color(Global.color.tree.module)
