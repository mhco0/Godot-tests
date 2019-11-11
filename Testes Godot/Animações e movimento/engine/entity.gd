extends KinematicBody2D

var SPEED = 0
var TYPE = "ENEMY"
var DAMAGE = 0

var health = 1
var knocktick = 0

var movedir = Vector2(0,0)
var knockbackdir = Vector2(0,0)

var spritedir = "down"

func movement_loop():
	var motion = dir.center
	if not knocktick:
		motion = movedir.normalized()*SPEED
	else:
		motion = knockbackdir.normalized()*SPEED
		
	move_and_slide(motion)
	pass

func sprite_loop():
	match movedir:
		Vector2(-1,0):
			spritedir = "left"
		Vector2(1,0):
			spritedir = "right"
		Vector2(0,-1):
			spritedir = "up"
		Vector2(0,1):
			spritedir = "down"
	pass

func match_animation(animation):
	var new_anim = str(animation,spritedir)
	if $anim.current_animation != new_anim:
		$anim.play(new_anim)
	pass
	
func damage_loop():
	if knocktick > 0 :
		knocktick -= 1
	
	for body in $hitbox.get_overlapping_bodies():
		if knocktick == 0 and body.get("TYPE") != TYPE and body.get("DAMAGE") != null:
			health -= body.get("DAMAGE")
			knocktick = 10
			knockbackdir = transform.origin - body.transform.origin
	pass