# https://www.youtube.com/watch?v=ggt05fCiH7M
extends Area2D

signal player_fired(bullet, position, direction);

export (int) var SPEED = 400;
export (PackedScene) var bullet;

onready var gun = $Gun;

var next_shoot_time = 10;
var current_shoot_time = 0;

func _ready():
	pass

func _process(delta):
	look_at(get_global_mouse_position());
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
	position += velocity * delta;
	
	current_shoot_time += 1;
	if Input.is_action_pressed("shoot"):
		shoot();
	pass

func _unhandled_input(event):
	if event.is_action_pressed("shoot"):
		shoot();
		pass
	pass
	
func shoot():
	if(next_shoot_time > current_shoot_time): return;
	current_shoot_time = 0;
	
	var bullet_instance = bullet.instance();
	
	var gun_pos = gun.global_position;
	var direction = ($BulletDirection.global_position - gun_pos).normalized();
	print(direction)
	emit_signal("player_fired", bullet_instance, gun_pos, direction);
	pass
