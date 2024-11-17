extends Node2D

@onready var game_music: AudioStreamPlayer2D = $GameMusic


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
