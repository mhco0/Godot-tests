extends Node2D
const WALKING_SPEED = 200
const RUNNING_SPEED = 400
var vel = WALKING_SPEED
var movement = [false,false,false,false]
var front = "right"
var running = false
var punching = false
enum {UP=0,DOWN,RIGHT,LEFT}

func _ready():
	set_process(true)
	pass # Replace with function body.

func move(delta) -> void:
	if Input.is_action_just_pressed("ui_up"):
		movement[UP] = true
		front = "up"
	
	if Input.is_action_just_pressed("ui_down"):
		movement[DOWN] = true
		front = "down"
		
	if Input.is_action_just_pressed("ui_right"):
		movement[RIGHT] = true
		front = "right"
		
	if Input.is_action_just_pressed("ui_left"):
		movement[LEFT] = true
		front = "left"
		
	if Input.is_action_just_released("ui_up"):
		movement[UP] = false
	
	if Input.is_action_just_released("ui_down"):
		movement[DOWN] = false
	
	if Input.is_action_just_released("ui_right"):
		movement[RIGHT] = false
	
	if Input.is_action_just_released("ui_left"):
		movement[LEFT] = false
	
	var h = 0 
	var v = 0
	var moving = false
	
	if(movement[UP] == true and movement[DOWN] == false):
		v = -1
		$AnimatedSprite.play("move_up")
		moving = true
		
	if(movement[DOWN] == true and movement[UP] == false):
		v = 1
		$AnimatedSprite.play("move_down")
		moving = true
		
	if(movement[RIGHT] == true and movement[LEFT] == false):
		h = 1
		$AnimatedSprite.play("move_right")
		moving = true
		
	if(movement[LEFT] == true and movement[RIGHT] == false):
		h = -1
		$AnimatedSprite.play("move_left")
		moving = true
	
	
	if(moving):
		set_position(get_position() + Vector2(h,v).normalized()*vel*delta)
	else:
		$AnimatedSprite.frame = 0
		$AnimatedSprite.stop()
	pass
	
func run() -> void:
	if Input.is_action_just_pressed("shift"):
		running = true
		$AnimatedSprite.speed_scale = 2
	if Input.is_action_just_released("shift"):
		running = false
		$AnimatedSprite.speed_scale = 1
		
	if(running):
		vel = RUNNING_SPEED
	else:
		vel = WALKING_SPEED
		
	pass 

func punch() ->  void:
	if Input.is_action_just_pressed("ui_accept"):
		match front:
			"up":
				$AnimatedSprite.play("punch_up")
			"down":
				$AnimatedSprite.play("punch_down")
			"right":
				$AnimatedSprite.play("punch_right")
			"left":
				$AnimatedSprite.play("punch_left") 
	
	
	pass

func _process(delta):
	move(delta)
	run()
	punch()
	pass