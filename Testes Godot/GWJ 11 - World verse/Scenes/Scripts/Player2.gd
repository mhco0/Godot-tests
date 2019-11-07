extends KinematicBody2D

var nodelose = preload("res://Scenes/LoseLayout.tscn")

const DOWN = Vector2(0, 1)
const GRAVITY = -30
const JUMP_HEIGHT = 900

var motion = Vector2()

func _physics_process(delta):
	add_to_group(Game.PLAYER)
	motion.y += GRAVITY
		
	if is_on_floor():
		$SpritePlayer.play("Idle")
		if Input.is_action_pressed("ui_select"):
			motion.y = JUMP_HEIGHT
	else:
		$SpritePlayer.play("Jump")
	
	move_and_slide(motion, DOWN)

func _on_Area2D_area_shape_entered(area_id, area, area_shape, self_shape):
	if area.is_in_group(Game.ENEMY_GROUP):
		youLose()

func youLose():
	var youlose = nodelose.instance()
	add_child(youlose)
	get_tree().paused = true
