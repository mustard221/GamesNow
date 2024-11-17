extends Control

@onready var win_screen_audio: AudioStreamPlayer2D = $WinScreenAudio


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win_screen_audio.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://Moving.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
