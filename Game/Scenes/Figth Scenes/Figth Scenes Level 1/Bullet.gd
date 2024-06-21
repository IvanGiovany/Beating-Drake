extends Area2D
class_name Bullet
var move_speed = 200.0

func _process(delta):
	position.y += delta * move_speed


