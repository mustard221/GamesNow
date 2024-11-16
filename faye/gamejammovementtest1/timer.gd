extends Node

@onready var label = $Label
@onready var timer = $Timer

func _ready():
	timer.start()
	

	
	
func time_left_to_live():
	var time_left = timer.time_left
	var minute = floor(time_left/60)
	var second = int(time_left)%60
	return[minute, second]
	
	if time_left == 0: #trying to make it change scene when timer ends but doesnt work currently 
		get_tree().change_scene_to_file("res://splashscreen.tscn")
	
func _process(delta):
	label.text = "%02d:%02d" % time_left_to_live()
	
	
	

	
