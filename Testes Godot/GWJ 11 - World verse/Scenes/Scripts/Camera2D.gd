extends Camera2D

var speed = 450

func _ready():
	set_process(true)

func _process(delta):
	set_offset(get_offset() + Vector2(1, 0) * speed * delta)