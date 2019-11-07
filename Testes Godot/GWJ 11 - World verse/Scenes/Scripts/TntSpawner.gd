extends Node

var onebarrel = preload("res://Scenes/Tnt.tscn")
var threebarrels = preload("res://Scenes/Tnt3.tscn")
var choises = [onebarrel, threebarrels]

func _ready():
	set_process(true)
	var t = Timer.new()
	add_child(t)
	t.wait_time = 1
	t.start()
	t.connect('timeout', self, 'spawn')
	yield(t, 'timeout')
	t.queue_free()
 
func spawn():
	randomize()
	var barrel = choises[randi()%choises.size()].instance()
	barrel.set_position(Vector2(1441.368, 536.538))
	get_owner().add_child(barrel)

	var t = Timer.new()
	add_child(t)
	t.wait_time = rand_range(1, 1.5)
	t.start()
	t.connect('timeout', self, 'spawn')
	yield(t, 'timeout')
	t.queue_free()