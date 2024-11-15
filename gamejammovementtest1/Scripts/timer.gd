extends Node

@onready var label = $timer
@onready var timer = $Timer


func _ready():
	timer.start()
	
func time_left_to_live():
	var time_left = timer.time_left
	var minute = floor(time_left/60)
	var second = int(time_left)% 60
	return[minute, second]
	
func _process(delta):
	label.text ="%02d:%02d" % time_left_to_live()
	
	if label.text == "00:00":
		get_tree().change_scene_to_file("res://splashscreen.tscn")
		
	
