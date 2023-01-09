extends Camera2D

export(NodePath) var player_path
var player

func _ready():
	player = get_node(player_path)
	pass
	
func _process(delta):
	if player.position.y < position.y:
		position = Vector2(0, player.position.y)
