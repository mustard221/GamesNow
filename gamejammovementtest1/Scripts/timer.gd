extends Node

class_name _Timer

var time = 0.0
var stopped = false #when game is paused, the timer stops

func _process(delta):
	if stopped:
		return
	time += delta
	
func reset():
	time = 0.0# resets timer if we had different levels, we won't but it could be good to have
	
