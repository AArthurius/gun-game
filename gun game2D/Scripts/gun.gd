extends Node2D

func _process(delta):
	look_at_mouse()

func look_at_mouse():
	look_at(get_global_mouse_position())
	if rotation_degrees > 270:
		rotation_degrees = -89
	if rotation_degrees < -90:
		rotation_degrees = 269
		
	if (rotation_degrees > 90 and rotation_degrees < 270) or (rotation_degrees < -90):
		$GunPlaceholder.flip_v = true
	else:
		$GunPlaceholder.flip_v = false
