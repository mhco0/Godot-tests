extends Sprite

var speed = 200

func _ready():
	set_process(true)

func _process(delta):
	set_position(get_position() + Vector2(0, 1) * speed * delta)
	
	if get_position().y >= 115.141:
		speed = 0
