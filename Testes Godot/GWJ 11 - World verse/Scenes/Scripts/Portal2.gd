extends Area2D

var speed = 390

func _ready():
	set_process(true)

func _process(delta):
	position += Vector2(1, 0) * speed * delta
	
	if position.x >= 1140:
		queue_free()

func _on_Node_body_entered(body):
	get_tree().change_scene("res://Scenes/Word.tscn")
