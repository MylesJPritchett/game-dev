extends RigidBody2D

const LIFETIME = 1000

var lifetime_counter
# Called when the node enters the scene tree for the first time.
func _ready():
	lifetime_counter = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if lifetime_counter > LIFETIME:
		queue_free()
	lifetime_counter += 1
	
func _physics_process(delta):
	look_at(global_position + linear_velocity)
