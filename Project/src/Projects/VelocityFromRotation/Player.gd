extends KinematicBody2D

export (int) var MAX_SPEED: int = 50
export (int) var ROTATION_SPEED: int = 200

var currentSpeed: int = 0
var currentRotationSpeed: int = 0

var velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	# Rotate
	if Input.is_action_pressed("left"): currentRotationSpeed = -ROTATION_SPEED
	elif Input.is_action_pressed("right"): currentRotationSpeed = ROTATION_SPEED
	else: currentRotationSpeed = 0
	
	# Move
	if Input.is_action_pressed("up"): currentSpeed += MAX_SPEED
	elif Input.is_action_pressed("down"): currentSpeed -= MAX_SPEED
	else: currentSpeed = 0
	pass

func _physics_process(delta: float) -> void:
	# Rotate
	rotation_degrees += currentRotationSpeed * delta
	
	# Move
	# Ref: https://godotengine.org/qa/25996/how-to-do-movement-based-on-rotation
	velocity = Vector2(1, 0).rotated(rotation) * currentSpeed
	velocity = move_and_slide(velocity)
	pass
