extends KinematicBody2D

export(int) var MAX_JUMPS = 2;
export var SPEED = 300;
export var JUMP_FORCE = -400;

var gravity = 600 # ProjectSettings.get_setting("physics/2d/default_gravity");
var motion_velocity = Vector2();
var current_jumps = 0;

func _ready():
	pass

func _process(delta):
	if not is_on_floor(): motion_velocity.y += gravity * delta;
	else: current_jumps = 0;
	
	# Jump
	if Input.is_action_just_pressed("platform_jump") and current_jumps < MAX_JUMPS:
		motion_velocity.y = JUMP_FORCE;
		current_jumps += 1;
		
	# Move
	var direction = Input.get_axis("left", "right");
	if direction: motion_velocity.x = direction * SPEED;
	else: motion_velocity.x = move_toward(motion_velocity.x, 0, SPEED);
	pass
	
func _physics_process(delta):
	motion_velocity = move_and_slide(motion_velocity, Vector2.UP);
	pass
