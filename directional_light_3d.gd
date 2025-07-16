extends DirectionalLight3D

var rotation_speed := 0.2
var direction := 1.0
var current_angle := 0.0
var max_angle := deg_to_rad(45.0)

func _process(delta: float) -> void:
	
	var delta_angle = rotation_speed * delta * direction
	current_angle = deg_to_rad(rotation_degrees.y) + delta_angle
	
	# Reverse direction if angle exceeds limits
	if current_angle >= max_angle or current_angle <= -max_angle:
		direction *= -1.0
		current_angle = clamp(current_angle, -max_angle, max_angle)

	rotate_y(delta_angle)
