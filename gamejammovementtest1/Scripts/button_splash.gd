extends Node2D

@onready var start_button_audio: AudioStreamPlayer2D = $StartButtonAudio


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	start_button_audio.play()
	get_tree().change_scene_to_file("res://Cutscene.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
