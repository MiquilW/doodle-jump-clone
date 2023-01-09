extends Position2D

export(PackedScene) var platform
export(PackedScene) var broken_platform
export(PackedScene) var jumpy

signal instance_node(node, location)

var maxi = 30
var spec_maxi = 20

var y_p = 0
var y_bp = -100
var y_jp = -200

func _ready():
	randomize()
	if Global.world != null:
		connect("instance_node", Global.world, "instance_node")

func _process(delta):
	print(Global.curr)
	if Global.curr < maxi:
		emit_signal("instance_node", platform, y_p)
		Global.curr += 1
		y_p -= rand_range(0, 200)
	if Global.spec_curr < spec_maxi:
		emit_signal("instance_node", jumpy, y_bp)
		emit_signal("instance_node", broken_platform, y_jp)
		Global.spec_curr += 2
		y_bp -= rand_range(350, 450)
		y_jp -= rand_range(400, 700)
