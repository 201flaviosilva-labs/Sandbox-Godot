extends Node2D

onready var PLAYER: Area2D = $Player
onready var ENEMIES_CONTAINER: Node2D = $Enemies

const ENEMY_SCENE: PackedScene = preload("res://src/Projects/AreaCollision/AreaCollisionCharacter.tscn")
const ENEMY_TEXTURES := [
	preload("res://Assets/Sprites/Balls/Blue.png"),
	preload("res://Assets/Sprites/Balls/Green.png"),
	preload("res://Assets/Sprites/Balls/Pink.png"),
	preload("res://Assets/Sprites/Balls/Red.png"),
	preload("res://Assets/Sprites/Balls/White.png"),
	preload("res://Assets/Sprites/Balls/Yellow.png")
]

const ENEMY_SPEED: int = 200 

var score: int = 0
var screen_size = Vector2.ZERO
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	PLAYER.position = get_global_mouse_position()
	_delete_children(ENEMIES_CONTAINER)
	screen_size = get_viewport_rect().size
	pass

func _process(delta: float) -> void:
	PLAYER.position = get_global_mouse_position()
	_move_all_enemies(delta)
	pass

func _create_enemy():
	var new_enemy = ENEMY_SCENE.instance()
	var y = rng.randi_range(0, screen_size.y)
	new_enemy.position = Vector2(screen_size.x, y)
	var scale = rng.randf_range(0.1, 2)
	new_enemy.scale = Vector2(scale, scale)
	new_enemy.get_node("Sprite").texture = _choice(ENEMY_TEXTURES)
	ENEMIES_CONTAINER.add_child(new_enemy)
	pass

func _move_all_enemies(delta: float):
	for child_node in ENEMIES_CONTAINER.get_children():
		child_node.position.x -= ENEMY_SPEED * delta
	pass

# ------------------------------
# ------------ Utils -----------
func _delete_children(node: Node2D):
	for child_node in node.get_children():
		node.remove_child(child_node)
		child_node.queue_free()
		
func _choice(arr):
	randomize()
	return arr[randi() % arr.size()]

# ------------------------------
# ------------ Events ----------
func _on_Player_area_entered(area: Area2D) -> void:
	score += 1
	area.queue_free()
	pass

# Create a new enemy
func _on_Timer_timeout() -> void:
	_create_enemy()
	pass
