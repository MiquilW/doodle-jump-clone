extends RigidBody2D

export(NodePath) var camera_path

var jump_force = 600
var boost_jump = 1200
var speed = 400

onready var sprite = get_node("Sprite")
onready var camera = get_node(camera_path)
onready var width = get_viewport_rect().size.x
onready var height = get_viewport_rect().size.y

onready var score = 0

func _ready():
	pass
	
func _physics_process(delta):
	Global.player_pos_y = self.position.y
	
	var left = Input.is_action_pressed("left") or Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("right") or Input.is_action_pressed("ui_right")
	
	if left:
		set_linear_velocity(Vector2(-speed, get_linear_velocity().y))
		sprite.flip_h = false
		
	if right:
		set_linear_velocity(Vector2(speed, get_linear_velocity().y))
		sprite.flip_h = true
		
	if !left and !right:
		set_linear_velocity(Vector2(0, get_linear_velocity().y))
		
	score = min(score, int(position.y))

func collision(body):
	if body.is_in_group("Paddles") and linear_velocity.y > 0:
		set_linear_velocity(Vector2(0, -jump_force))
	if body.is_in_group("Jumpy") and linear_velocity.y > 0:
		set_linear_velocity(Vector2(0, -boost_jump))
	pass 


func _on_VisibilityNotifier2D_screen_exited():
	if position.x > camera.position.x and linear_velocity.x > 0:
		position = Vector2(-width/2, position.y)
	if position.x < camera.position.x and linear_velocity.x < 0:
		position = Vector2(width/2, position.y)
		
	if position.y > camera.position.y + height/2:
		get_tree().change_scene("res://Scenes/MainMenu.tscn")
