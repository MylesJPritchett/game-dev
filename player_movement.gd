extends RigidBody2D


const FORWARD_ACCELERATION = 1000000 #pixels/sec/sec
const SIDE_AND_BACK_ACCELERATION = 500000 #pixels/sec/sec
const MAX_SPEED = 20000 #pixels/sec
const ROTATION_SPEED = 5 #lerp between current and mouse
const BULLET_FORCE = 500
const FIRE_RATE = 50


var bullet_scene = load("res://bullet.tscn")
var time_to_next_shot = 0


@onready var end_of_gun = $end_of_gun


func _ready():
	time_to_next_shot = 0
	
func _process(delta):
	shoot()


func _physics_process(delta):
	movement(delta)
	
	
func movement(delta):
	var forward_input = -1 * Input.get_axis("up", "down")
	var strafe_input = Input.get_axis("left", "right")
	
	var thrust_force :Vector2
	
	var direction = get_global_mouse_position() - global_position
	var angle_to = transform.x.angle_to(direction)
	
	rotate(sign(angle_to) * min(delta * ROTATION_SPEED, abs(angle_to)))
	
	if forward_input > 0:
		thrust_force += transform.x * forward_input * FORWARD_ACCELERATION * delta
	elif forward_input < 0:
		thrust_force += transform.x * forward_input * SIDE_AND_BACK_ACCELERATION * delta
		
	thrust_force += transform.y * strafe_input * SIDE_AND_BACK_ACCELERATION * delta
	
	apply_force(thrust_force)

func shoot():
	if Input.is_action_pressed("lmb") and time_to_next_shot <= 0:
		var bullet_instance = bullet_scene.instantiate()
		var level_root = get_parent()
		level_root.add_child(bullet_instance)
		bullet_instance.global_position = end_of_gun.global_position
		var bullet_force = linear_velocity + Vector2(BULLET_FORCE, 0).rotated(global_rotation)
		bullet_instance.look_at(global_position + bullet_force)
		bullet_instance.apply_impulse(bullet_force)
		
		time_to_next_shot = FIRE_RATE
	time_to_next_shot -= 1
