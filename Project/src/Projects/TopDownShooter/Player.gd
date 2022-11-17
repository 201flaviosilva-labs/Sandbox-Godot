extends Area2D

signal player_fired(bullet, position, direction);

export (int) var SPEED = 400;
export (PackedScene) var bullet;
export (float) var GUN_COOLDOWN: float = 0.1

onready var GUN_POSITION: Position2D = $GunPosition;
onready var BULLET_DIRECTION: Position2D = $BulletDirection;
onready var SHOOT_TIMER: Timer = $ShootTimer;

var can_shoot: bool = true

func _ready():
	SHOOT_TIMER.wait_time = GUN_COOLDOWN
	pass

func _process(delta):
	look_at(get_global_mouse_position())
	
	var velocity = Vector2.ZERO;
	if Input.is_action_pressed("up"): velocity.y -= SPEED;
	if Input.is_action_pressed("down"): velocity.y += SPEED;
	
	if Input.is_action_pressed("left"): velocity.x -= SPEED;
	if Input.is_action_pressed("right"): velocity.x += SPEED;
		
	velocity = velocity.normalized() * SPEED;
	position += velocity * delta;
	
	if Input.is_action_pressed("shoot"): shoot()
	pass

func _unhandled_input(event):
	if event.is_action_pressed("shoot"): shoot()
	pass
	
func shoot():
	if not can_shoot: return
	can_shoot = false
	
	SHOOT_TIMER.start()
	
	var bullet_instance = bullet.instance();
	
	var gun_pos = GUN_POSITION.global_position;
	var direction = (BULLET_DIRECTION.global_position - gun_pos).normalized();
	emit_signal("player_fired", bullet_instance, gun_pos, direction);
	pass


func _on_ShootTimer_timeout() -> void:
	can_shoot = true
	pass
