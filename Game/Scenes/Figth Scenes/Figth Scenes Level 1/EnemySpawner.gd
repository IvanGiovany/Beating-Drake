extends Node2D

class_name EnemySpawner

@export var enemy_instance : PackedScene
func  _ready():
	pass

func _on_spawn_timer_timeout():
	spawn_enemy()
	
func spawn_enemy():
	
	var enemy = enemy_instance.instantiate() as Bullet
	enemy.position = Vector2(randi_range(300, 700), 136)
	get_tree().root.get_node("/root/Boss-coldSkull/HeartBox").add_child(enemy)

func _on_timer_timeout():
	_on_spawn_timer_timeout() 
	

