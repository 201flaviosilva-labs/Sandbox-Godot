extends Node2D

onready var bullets_container = $BulletsContainer;
onready var player = $Player;


func _ready():
	player.connect("player_fired", self, "_player_fired");
	pass

func _player_fired(new_bullet, start_position, direction):
	bullets_container.add_child(new_bullet);
	new_bullet.global_position = start_position;
	new_bullet.set_direction(direction);
	pass


func _on_Timer_timeout() -> void:
	print("beep")
	pass # Replace with function body.
