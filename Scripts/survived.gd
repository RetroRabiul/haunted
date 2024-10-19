extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$BackgroundAudio.playing = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_menu_button_pressed() -> void:
	$ButtonAudio.playing = true
	await($ButtonAudio)
	call_deferred("_change_scene")
	
func _change_scene():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
