extends Node2D
@onready var player = $Player

func _ready():
	player.game_state = player.State.CUTSCENE
	pass
