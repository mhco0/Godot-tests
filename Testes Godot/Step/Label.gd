extends Label;

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var accum = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass; # Replace with function body.
	
func _process(delta):
	if (accum <= 2):
		accum += delta;
		text = str(accum);

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
