extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.play()

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/MenuNode.tscn")
