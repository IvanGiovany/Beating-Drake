extends StaticBody2D
class_name Angel
func _ready():
	print("here")



func _on_area_2d_area_entered(area):
	self.z_index = 0
	pass

func _on_area_2d_area_exited(area):
	self.z_index = -1 # Replace with function body.
	pass
