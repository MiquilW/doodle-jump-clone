extends Node2D

func _ready():
	Global.world = self
	Global.curr = 0
	Global.spec_curr = 0
		
func _exit_tree():
	Global.world = null
	
func instance_node(node, location):
	var node_instance = node.instance()
	add_child(node_instance)
	node_instance.position = Vector2(rand_range(-210, 230), location)
		
