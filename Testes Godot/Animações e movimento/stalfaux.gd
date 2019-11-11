extends "res://engine/entity.gd"

var tick_legth = 15
var tick = tick_legth

func _ready():
	SPEED = 40
	TYPE = "ENEMY"
	DAMAGE = 1
	
	$anim.play("default")
	movedir = dir.rand()
	pass 

func ticking()->void:
	if tick > 0 :
		tick -= 1
	if tick == 0 or is_on_wall():
		tick = tick_legth
		movedir = dir.rand()
	pass

func _physics_process(delta):
	movement_loop()
	damage_loop()
	ticking()