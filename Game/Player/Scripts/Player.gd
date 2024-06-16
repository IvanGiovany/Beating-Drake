class_name Player extends CharacterBody2D


var states = ["walk","idle"]
var move_speed : float = 50.0
var cardinal_direction = {Vector2.LEFT : "left", Vector2.RIGHT : "right", Vector2.DOWN : "down", Vector2.UP : "up"}
var facing = ""
var direction : Vector2 = Vector2.ZERO
var current_state = "idle"; var counter = false
@onready var animation_player = $AnimationPlayer
@onready var sprite_2d = $Sprite2D



func _ready():
	pass
func _process(delta): 
	direction.x = Input.get_action_strength("Rigth") - Input.get_action_strength("Left") 
	direction.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	detect_state_change()
	set_direction()
	update_animation()
	velocity = direction * move_speed
	
func _physics_process(delta): 
	move_and_slide()
	
func set_direction():
	if direction.x > 0 and direction.y == 0:
		facing = cardinal_direction[Vector2.RIGHT]
	if direction.x < 0 and direction.y == 0:
		facing = cardinal_direction[Vector2.LEFT]
	if direction.y > 0 and direction.x == 0:
		facing = cardinal_direction[Vector2.DOWN]
	if direction.y < 0 and direction.x == 0:
		facing = cardinal_direction[Vector2.UP]
func detect_state_change():
	if direction == Vector2.ZERO:
		idle_state()
		return
	walk_state()		
	pass

func idle_state():
	current_state = states[1]
	direction = Vector2.ZERO

func walk_state():
	current_state = states[0]
	pass
func update_animation():
	animation_player.play(current_state + "_" + facing)
	pass
 
