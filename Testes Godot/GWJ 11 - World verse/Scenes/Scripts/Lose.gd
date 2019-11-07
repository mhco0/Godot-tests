extends Control

func _on_RestartButton_pressed():
	visible = not get_tree().paused
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_MenuButton_pressed():
	visible = not get_tree().paused
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/MenuNode.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()
