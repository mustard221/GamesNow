extends CanvasLayer

var label = Label
var time = Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label = $Label
	time = $Timer
	
	time.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_label_text()
	
	if time.time_left <= 0.1:
		get_tree().change_scene_to_file("res://splashscreen.tscn")
	

func update_label_text():
	label.text = str(ceil(time.time_left))
