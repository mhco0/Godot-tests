extends CanvasLayer

signal start_game

func show_mensage(txt):
	$MensageLabel.text = txt
	$MensageLabel.show()
	$MensageTimer.start()
	
func show_game_over():
	show_mensage("Game Over")
	yield($MensageTimer,"timeout")
	$MensageLabel.text = "Dodge the\nCreeps!"
	$MensageLabel.show()
	yield(get_tree().create_timer(1), 'timeout')
	$StartButton.show() 
	
func update_score(score):
	$ScoreLabel.text = str(score)


func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")

func _on_MensageTimer_timeout():
	$MensageLabel.hide()
