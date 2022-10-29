extends Node2D

export (int) var SPEED = 400;
export (int) var GRAVITY = 300

onready var player = $KinematicBody2D

func _ready():
	pass

func _physics_process(delta):
	_move(delta);

func _move(delta):
	var velocity = Vector2.ZERO;
	
	if Input.is_action_pressed("up"):
		velocity.y -= SPEED;
	elif Input.is_action_pressed("down"):
		velocity.y += SPEED;
	
	if Input.is_action_pressed("left"):
		velocity.x -= SPEED;
	elif Input.is_action_pressed("right"):
		velocity.x += SPEED;
		
	velocity = velocity.normalized() * SPEED;
	player.position += velocity * delta;
	pass
