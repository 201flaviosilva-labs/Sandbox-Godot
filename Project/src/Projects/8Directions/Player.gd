extends KinematicBody2D

export var SPEED = 300;

var motion_velocity = Vector2();
var current_speed = SPEED
var isRunning = false

onready var animation_tree = $AnimationTree
onready var animation_mode = animation_tree.get("parameters/playback")

func _ready():
	animation_tree.active = true
	pass

func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	# "Move"
	if direction: motion_velocity = direction.normalized() * current_speed
	else: motion_velocity = motion_velocity.move_toward(Vector2.ZERO, current_speed)
	
	# Run
	if Input.is_action_just_pressed("run"): 
		current_speed = SPEED * 2
		isRunning = true
		
	if Input.is_action_just_released("run"): 
		current_speed = SPEED
		isRunning = false
		
	# Change Animation	
	if direction.length():
		animation_tree.set("parameters/Idle/blend_position", direction)
		animation_tree.set("parameters/Run/blend_position", direction)
		animation_tree.set("parameters/Walk/blend_position", direction)
		
		if isRunning: animation_mode.travel("Run")
		else: animation_mode.travel("Walk")
	else: animation_mode.travel("Idle")
	
	pass
	
func _physics_process(delta):
	motion_velocity = move_and_slide(motion_velocity);
	pass
