extends KinematicBody2D

export var SPEED = 300

var direction = Vector2(1, 1);

func _ready():
	pass

func _physics_process(delta):
	var collision = move_and_collide(direction * SPEED * delta)
	if collision: direction = direction.bounce(collision.normal)
	pass
