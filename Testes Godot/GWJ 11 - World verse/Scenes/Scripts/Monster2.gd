extends Area2D

var speed = 450

func _ready():
	add_to_group(Game.ENEMY_GROUP)
	set_process(true)
	
func _process(delta):
	position += Vector2(1, 0) * speed * delta

	if get_position().x >= 1104:
		queue_free()

func _on_Area2D_body_entered(body):
	pass
