extends Node

var Portal_preload = preload("res://Scenes/Portal2.tscn")

func _ready():
	set_process(true)
	var t = Timer.new()
	add_child(t)
	t.wait_time = 15
	t.start()
	t.connect('timeout', self, 'spawn')
	yield(t, 'timeout')
	t.queue_free()
 
func spawn():
	randomize()
	var portal = Portal_preload.instance()
	portal.set_position(Vector2(-727.604, 330.958))
	get_owner().add_child(portal)

	var t = Timer.new()
	add_child(t)
	t.wait_time = rand_range(13, 15)
	t.start()
	t.connect('timeout', self, 'spawn')
	yield(t, 'timeout')
	t.queue_free()