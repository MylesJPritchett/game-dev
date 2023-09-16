extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_offset:Vector2 = (Vector2i(get_viewport().get_mouse_position()) - get_viewport().size / 2)
	self.position = lerp(Vector2(), mouse_offset.normalized() * 500, mouse_offset.length() / 1000)
	pass
