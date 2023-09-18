extends Marker2D

var bullet_scene = load("res://bullet.tscn")

@onready var end_of_gun = $end_of_gun


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("lmb"):
		var bullet_instance = bullet_scene.instantiate()
		add_child(bullet_instance)
		bullet_instance.global_position = end_of_gun.global_position
		bullet_instance.apply_impulse()
		
	pass
