extends Control

var texture_godot = preload("res://icon.png");
var texture_ship = preload("res://Assets/Sprites/Space Shooter Redux/PNG/Enemies/enemyBlack1.png");
var texture_ninica = preload("res://Assets/Images/Ninica1.jpeg");

func _ready():
	pass
	
func _process(delta):
	if Input.is_action_just_released("1"):
		$Sprite.set_texture(texture_godot);
	elif Input.is_action_just_released("2"):
		$Sprite.set_texture(texture_ship);
	elif Input.is_action_just_released("3"):
		$Sprite.set_texture(texture_ninica);
	pass
