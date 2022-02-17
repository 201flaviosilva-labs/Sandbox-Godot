extends Node2D


func _ready():
	pass

func _process(delta):
	$MouseLight.position = get_global_mouse_position();
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://src/Scenes/Start.tscn");
	pass # Replace with function body.
