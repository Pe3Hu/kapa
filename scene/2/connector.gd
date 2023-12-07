extends Line2D


var scheme = null
var riverbed = null
var estuary = null


func set_attributes(input_: Dictionary) -> void:
	scheme = input_.scheme
	riverbed = input_.scheme
	
	init_estuary()


func init_estuary() -> void:
	var input = {}
	input.track = self
	input.position = riverbed.position.normalized() * (Global.num.track.l + Global.num.riverbed.l)

	estuary = Global.scene.module.instantiate()
	scheme.modules.add_child(estuary)
	estuary.set_attributes(input)
	add_point(riverbed.position)
	add_point(estuary.position)
	
	default_color = Global.color.scheme.connector
	width = Global.num.connector.r
