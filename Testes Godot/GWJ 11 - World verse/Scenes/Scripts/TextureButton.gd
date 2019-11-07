extends TextureButton

var speed = 300

func _ready():
	set_process(true)

func _process(delta):
	set_position(get_position() + Vector2(1, 0) * speed * delta)
	
	if get_position().x >= 380:
		speed = 0
