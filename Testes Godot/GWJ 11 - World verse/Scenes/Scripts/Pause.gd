extends Control	

func _on_ResumeButton_pressed():
	visible = not get_tree().paused
	get_tree().paused = false

func _on_MenuButton_pressed():
	visible = not get_tree().paused
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/MenuNode.tscn")

func _on_PauseButton_pressed():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state

func _on_QuitButton_pressed():
	get_tree().quit()
