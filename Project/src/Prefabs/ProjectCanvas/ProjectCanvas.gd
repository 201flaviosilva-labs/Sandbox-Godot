extends CanvasLayer

export(String) var PROJECT_NAME = "Project Name"

func _ready():
	$UI/ProjectTitle.text = PROJECT_NAME
	pass
