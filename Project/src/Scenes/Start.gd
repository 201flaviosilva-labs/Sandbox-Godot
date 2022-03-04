extends Control


func _ready():
	pass

func _on_ChangeSceneBtn_pressed():
	get_tree().change_scene("res://src/Projects/ChangeScene/ChangeScene.tscn");
	pass # Replace with function body.

func _on_RaioXBtn_pressed():
	get_tree().change_scene("res://src/Projects/Raio-X/RaioX.tscn");
	pass # Replace with function body.


func _on_TopDownShootBtn_pressed():
	get_tree().change_scene("res://src/Projects/TopDownShooter/TopDownShooter.tscn");
	pass # Replace with function body.


func _on_ChangeTextureBtn_pressed():
	get_tree().change_scene("res://src/Projects/ChangeTexture/ChangeTexture.tscn");
	pass # Replace with function body.

func _on_SmoothLookAtBTN_pressed():
	get_tree().change_scene("res://src/Projects/SmoothLookAt/SmoothLookAt.tscn");
	pass # Replace with function body.
