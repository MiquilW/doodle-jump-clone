extends Label

export(NodePath) var player_path
var player

var fstring = "%s"

func _ready():
	player = get_node(player_path)
	
func _process(delta):
	var new_string = fstring % -player.score
	self.text = new_string
