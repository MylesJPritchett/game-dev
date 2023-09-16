extends CharacterBody2D


const ACCELERATION = 10 #pixels/sec/sec
const MAX_SPEED = 30 #pixels/sec
const ROTATION_SPEED = 5 #radians/sec





func _physics_process(delta):
	var move_input = Input.get_axis("up", "down")
	var rotate_direction = Input.get_axis("left", "right") 
	
	velocity +=  transform.y * move_input * ACCELERATION
	velocity.y = clamp(velocity.y, -MAX_SPEED, MAX_SPEED)
	velocity.x = clamp(velocity.x, -MAX_SPEED, MAX_SPEED)
	rotation += rotate_direction * ROTATION_SPEED * delta
	print(velocity)
	move_and_slide()
