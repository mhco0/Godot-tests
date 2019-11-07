extends AnimatedSprite

var speed = 200

func _ready():
	set_process(true)

func _process(delta):
	set_position(get_position() + Vector2(1, 0) * speed * delta)
	
	if get_position().x >= 122.248:
		speed = 0
	
	
	

