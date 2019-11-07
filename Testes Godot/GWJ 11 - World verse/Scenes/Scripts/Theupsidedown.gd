extends CanvasLayer

func _ready():
	set_process(true)
	$AnimationPlayer.play("BackGround")