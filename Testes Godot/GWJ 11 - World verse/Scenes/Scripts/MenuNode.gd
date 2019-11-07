extends CanvasLayer

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/Word.tscn")


func _on_PowerButton_pressed():
	get_tree().quit()


func _on_TextureButton2_pressed():
	get_tree().change_scene("res://Scenes/About.tscn")
