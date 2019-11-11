extends Node

const center = Vector2(0,0)
const up	 = Vector2(0,-1)
const down	 = Vector2(0,1)
const right  = Vector2(1,0)
const left	 = Vector2(-1,0)

func rand()->Vector2:
	var r = randi()%5
	
	match r:
		0: 
			return center
		1:
			return up
		2:
			return down
		3:
			return right
		4:
			return left
	pass