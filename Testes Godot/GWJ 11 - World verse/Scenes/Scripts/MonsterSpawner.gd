extends Node

var ThreeEye = preload("res://Scenes/Monster.tscn")
var Flying = preload("res://Scenes/Monster2.tscn")
var choises = [ThreeEye, Flying]

func _ready():
	set_process(true)
	var t = Timer.new()
	add_child(t)
	t.wait_time = 2
	t.start()
	t.connect('timeout', self, 'spawn')
	yield(t, 'timeout')
	t.queue_free()
 
func spawn():
	randomize()
	var monster = choises[randi()%choises.size()].instance()
	monster.set_position(Vector2(-265.203, 69.87))
	get_owner().add_child(monster)

	var t = Timer.new()
	add_child(t)
	t.wait_time = rand_range(1, 2)
	t.start()
	t.connect('timeout', self, 'spawn')
	yield(t, 'timeout')
	t.queue_free()