extends "res://engine/entity.gd"  

func _ready():
	SPEED = 70
	TYPE = "PLAYER"
	DAMAGE = 1
	pass

func constrol_loop():
	var up    = Input.is_action_pressed("ui_up")
	var down  = Input.is_action_pressed("ui_down")
	var left  = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	
	movedir.x = -int(left)+int(right)
	movedir.y = -int(up)+int(down)
	pass

func _physics_process(delta):
	constrol_loop()
	movement_loop()
	sprite_loop()
	damage_loop()
	
	if is_on_wall():
		if spritedir == "up" and test_move(transform,dir.up):
			match_animation("push")
		if spritedir == "down" and test_move(transform,dir.down):
			match_animation("push")
		if spritedir == "left" and test_move(transform,dir.left):
			match_animation("push")
		if spritedir == "right" and test_move(transform,dir.right):
			match_animation("push")
	elif movedir == dir.center:
		match_animation("idle")
	else:
		match_animation("walk")

