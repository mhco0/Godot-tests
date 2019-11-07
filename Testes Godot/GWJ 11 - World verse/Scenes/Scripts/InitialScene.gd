extends Node

func _ready():
	set_process(true)
	$AnimationPlayer.play("PoupOpacite")
	
func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://Scenes/MenuNode.tscn")