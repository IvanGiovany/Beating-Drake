extends CharacterBody2D
class_name Player

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_2d = $CollisionShape2D

enum State { CUTSCENE, PLAYER_CONTROL }
var game_state = State.PLAYER_CONTROL
var current_state = "idle"
var direction = Vector2.ZERO
var move_speed = 400.0
var facing = "down"

var cutscene_duration =1.0  # Duration of the cutscene in seconds
var cutscene_timer = 0.0     # Timer to track elapsed time in cutscene

func _ready():
	pass

func _process(delta):
	match game_state:
		State.CUTSCENE:
			set_process(false)
			handle_cutscene(delta)
			update_animation()
		State.PLAYER_CONTROL:
			direction.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
			direction.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
			detect_state()
			detect_direction()
			update_animation()
			velocity = direction.normalized() * move_speed

func _physics_process(delta):
	if game_state == State.PLAYER_CONTROL:
		move_and_slide()
	else:
		move_and_slide()

func detect_state():
	if direction != Vector2.ZERO:
		current_state = "walk"
	else:
		current_state = "idle"

func detect_direction():
	if direction == Vector2.LEFT:
		facing = "left"
	elif direction == Vector2.RIGHT:
		facing = "right"
	elif direction == Vector2.UP or direction == Vector2(-1,-1) or direction == Vector2(1,-1):
		facing = "up"
	elif direction == Vector2.DOWN or direction == Vector2(-1,1) or direction == Vector2(1,-1):
		facing = "down"
	else:
		return

func update_animation():
	animated_sprite_2d.play(current_state + "_" + facing)

func handle_cutscene(delta):
	# Simulate cutscene movement
	direction = Vector2.RIGHT  # Move the player during cutscene
	velocity = Vector2(100, 0)  # Adjust velocity as needed

func end_cutscene():
	current_state = "idle"
	game_state = State.PLAYER_CONTROL
	direction = Vector2.ZERO 
	set_process(true)  # Resume player control after cutscene ends

func _on_introduction_child_entered_tree(node):
	game_state = State.CUTSCENE
	current_state = "walk"
	facing = "right"
	cutscene_timer = 0.0  # Reset the timer when entering cutscene



func _on_timer_timeout():
	end_cutscene()
	pass # Replace with function body.
