extends Node2D


func _ready():
	pass

func _physics_process(delta):
	# Tutorial: https://www.youtube.com/watch?v=ciT_jDol9G8
	var rotation_speed = 0.05;
	var vector_ship_to_mouse = global_position - get_global_mouse_position();
	var angle = vector_ship_to_mouse.angle();
	var ship_rotation = global_rotation;
	global_rotation = lerp_angle(ship_rotation, angle, rotation_speed);
	pass
