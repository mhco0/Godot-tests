extends Area2D

var speed = 450

func _ready():
	add_to_group(Game.ENEMY_GROUP)
	set_process(true)
	
func _process(delta):
	set_position(get_position() + Vector2(-1, 0) * speed * delta)
	
	if get_position().x < -120:
		queue_free()

func _on_Node2D_body_entered(body):
	queue_free()
	pass
