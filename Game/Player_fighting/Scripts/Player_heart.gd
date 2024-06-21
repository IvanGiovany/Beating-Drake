extends CharacterBody2D
class_name PlayerHeart

var direction: Vector2 = Vector2.ZERO
var move_speed: float = 25000.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
	direction = Vector2(
		Input.get_axis("Left", "Right"),
		Input.get_axis("Up", "Down")
	).normalized()
	velocity = direction * move_speed * delta


func _physics_process(delta):
		move_and_slide()

