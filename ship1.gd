extends CharacterBody2D


const FORWARD_ACCELERATION = 100 #pixels/sec/sec
const SIDE_AND_BACK_ACCELERATION = 50 #pixels/sec/sec
const MAX_SPEED = 200 #pixels/sec
const ROTATION_SPEED = 5 #radians/sec




func get_input():
	
	look_at(get_global_mouse_position())
	


func _physics_process(delta):
	
	
	var forward_input = -1 * Input.get_axis("up", "down")
	var strafe_input = Input.get_axis("left", "right")
	
	var thrust_force :Vector2
	
	get_input()
	
	thrust_force += transform.x * forward_input * FORWARD_ACCELERATION * delta
	thrust_force += transform.y * strafe_input * SIDE_AND_BACK_ACCELERATION * delta
	
	velocity += thrust_force
	
	velocity.x = clamp(velocity.x, -MAX_SPEED, MAX_SPEED)
	velocity.y = clamp(velocity.y, -MAX_SPEED, MAX_SPEED)
	

	print(velocity)
	move_and_slide()
