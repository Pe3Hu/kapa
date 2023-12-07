extends Node


var rng = RandomNumberGenerator.new()
var arr = {}
var num = {}
var vec = {}
var color = {}
var dict = {}
var flag = {}
var node = {}
var scene = {}


func _ready() -> void:
	init_arr()
	init_num()
	init_vec()
	init_color()
	init_dict()
	init_node()
	init_scene()


func init_arr() -> void:
	arr.edge = [1, 2, 3, 4, 5, 6]
	arr.root = ["strength", "dexterity", "intellect", "will"]
	arr.branch = ["volume","resistance","tension","replenishment","inside","outside","reaction"]
	arr.scheme = ["module", "connector"]


func init_num() -> void:
	num.index = {}
	
	num.aspect = {}
	num.aspect.min = 5
	num.aspect.avg = 10
	num.aspect.max = 15
	
	num.module = {}
	num.module.r = 20
	
	num.connector = {}
	num.connector.h = num.module.r * 2 * sqrt(3) / 2
	num.connector.l = num.module.r * 3
	init_num_old()
	

func init_num_old() -> void:
	num.index.room = 0
	num.index.door = 0
	num.index.card = 0
	
	num.ring = {}
	num.ring.r = 50
	num.ring.segment = 18#9
	
	num.room = {}
	num.room.r = 8
	
	num.outpost = {}
	num.outpost.r = num.room.r * 2
	
	num.obstacle = {}
	num.obstacle.r = num.room.r * 1.25
	
	num.content = {}
	num.content.r = num.room.r * 0.75
	
	num.areola = {}
	num.areola.r = num.room.r * 2
	
	num.sectors = {}
	num.sectors.primary = 4
	num.sectors.final = 3
	
	num.relevance = {}
	num.relevance.resource = {}
	num.relevance.resource.fuel = 1
	num.relevance.resource.mineral = 2
	num.relevance.resource.knowledge = 3
	num.relevance.resource.energy = 4
	num.relevance.resource.damage = 5
	num.relevance.resource.intelligence = 6
	
	num.relevance.token = {}
	num.relevance.token.recharge = 1
	num.relevance.token.boost = -2
	num.relevance.token.overload = -4
	num.relevance.token.breakage = -8


func init_dict() -> void:
	init_neighbor()
	init_door()
	
	dict.thousand = {}
	dict.thousand[""] = "k"
	dict.thousand["k"] = "m"
	dict.thousand["m"] = "b"
	
	dict.ring = {}
	dict.ring.weight = {}
	dict.ring.weight["single"] = 7
	dict.ring.weight["trapeze"] = 5
	dict.ring.weight["equal"] = 9
	dict.ring.weight["double"] = 3
	#dict.ring.weight["triple"] = 1


func init_neighbor() -> void:
	dict.neighbor = {}
	dict.neighbor.linear3 = [
		Vector3( 0, 0, -1),
		Vector3( 1, 0,  0),
		Vector3( 0, 0,  1),
		Vector3(-1, 0,  0)
	]
	dict.neighbor.linear2 = [
		Vector2( 0,-1),
		Vector2( 1, 0),
		Vector2( 0, 1),
		Vector2(-1, 0)
	]
	dict.neighbor.diagonal = [
		Vector2( 1,-1),
		Vector2( 1, 1),
		Vector2(-1, 1),
		Vector2(-1,-1)
	]
	dict.neighbor.zero = [
		Vector2( 0, 0),
		Vector2( 1, 0),
		Vector2( 1, 1),
		Vector2( 0, 1)
	]
	dict.neighbor.hex = [
		[
			Vector2( 1,-1), 
			Vector2( 1, 0), 
			Vector2( 0, 1), 
			Vector2(-1, 0), 
			Vector2(-1,-1),
			Vector2( 0,-1)
		],
		[
			Vector2( 1, 0),
			Vector2( 1, 1),
			Vector2( 0, 1),
			Vector2(-1, 1),
			Vector2(-1, 0),
			Vector2( 0,-1)
		]
	]


func init_emptyjson() -> void:
	dict.emptyjson = {}
	dict.emptyjson.title = {}
	
	var path = "res://asset/json/.json"
	var array = load_data(path)
	
	for emptyjson in array:
		var data = {}
		
		for key in emptyjson:
			if key != "title":
				data[key] = emptyjson[key]
		
		dict.emptyjson.title[emptyjson.title] = data


func init_door() -> void:
	dict.door = {}
	dict.door.length = {}
	dict.door.length.sector = {}
	
	var path = "res://asset/json/haerenga_door_length.json"
	var array = load_data(path)
	
	for length in array:
		dict.door.length.sector[float(length.sector)] = {}
		
		for key in length:
			if key != "sector":
				dict.door.length.sector[float(length.sector)][key] = float(length[key])


func init_node() -> void:
	node.game = get_node("/root/Game")


func init_scene() -> void:
	scene.guild = load("res://scene/1/guild.tscn")
	scene.member = load("res://scene/1/member.tscn")
	
	scene.aspect = load("res://scene/2/aspect.tscn")
	scene.module = load("res://scene/2/module.tscn")
	scene.connector = load("res://scene/2/connector.tscn")
	
	scene.icon = load("res://scene/0/icon.tscn")
	scene.door = load("res://scene/1/door.tscn")
	scene.room = load("res://scene/1/room.tscn")


func init_vec():
	vec.size = {}
	vec.size.letter = Vector2(20, 20)
	vec.size.icon = Vector2(48, 48)
	vec.size.number = Vector2(5, 32)
	vec.size.sixteen = Vector2(16, 16)
	
	vec.size.aspect = Vector2(32, 32) * 2
	vec.size.box = Vector2(100, 100)
	vec.size.bar = Vector2(120, 12)
	
	vec.size.scheme = Vector2(900, 700)
	
	init_window_size()


func init_window_size():
	vec.size.window = {}
	vec.size.window.width = ProjectSettings.get_setting("display/window/size/viewport_width")
	vec.size.window.height = ProjectSettings.get_setting("display/window/size/viewport_height")
	vec.size.window.center = Vector2(vec.size.window.width/2, vec.size.window.height/2)


func init_color():
	var h = 360.0
	
	color.scheme = {}
	color.scheme.module = Color.from_hsv(270 / h, 0.9, 0.7)
	color.scheme.connector = Color.from_hsv(30 / h, 0.9, 0.7)


func save(path_: String, data_: String):
	var path = path_ + ".json"
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(data_)


func load_data(path_: String):
	var file = FileAccess.open(path_, FileAccess.READ)
	var text = file.get_as_text()
	var json_object = JSON.new()
	var parse_err = json_object.parse(text)
	return json_object.get_data()


func get_random_key(dict_: Dictionary):
	if dict_.keys().size() == 0:
		print("!bug! empty array in get_random_key func")
		return null
	
	var total = 0
	
	for key in dict_.keys():
		total += dict_[key]
	
	rng.randomize()
	var index_r = rng.randf_range(0, 1)
	var index = 0
	
	for key in dict_.keys():
		var weight = float(dict_[key])
		index += weight/total
		
		if index > index_r:
			return key
	
	print("!bug! index_r error in get_random_key func")
	return null

func check_lines_intersection(lines_: Array) -> bool:
	var intersection = get_lines_intersection(lines_)
	
	if intersection != null:
		return check_point_inside_rect(intersection, lines_[0]) and check_point_inside_rect(intersection, lines_[1])
	else:
		return false


func get_lines_intersection(lines_: Array) -> Variant:
	var a = lines_[0][0]
	var b = lines_[0][1]
	var c = lines_[1][0]
	var d = lines_[1][1]
	
	var dir_a = b - a
	var dir_c = d - c
	var vertex = Geometry2D.line_intersects_line(a, dir_a, c, dir_c)
	return vertex


func check_point_inside_rect(point_: Vector2, rect_: Array) -> bool:
	var value = {}
	value.min = Vector2()
	value.max = Vector2()
	value.min.x = min(rect_.front().x, rect_.back().x)
	value.min.y = min(rect_.front().y, rect_.back().y)
	value.max.x = max(rect_.front().x, rect_.back().x)
	value.max.y = max(rect_.front().y, rect_.back().y)
	return point_.x >= value.min.x and point_.x <= value.max.x and point_.y >= value.min.y and point_.y <= value.max.y

