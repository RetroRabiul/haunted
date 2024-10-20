extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_play_animations()
	
	

func _play_animations():
	$AnimationPlayer.play("SpriteAnim")
	call_deferred("_text_anim")
	_text_anim()
	
func _text_anim():
	$AnimationPlayer2.play("TextAnim")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	$ButtonAudio.playing = true
	await($ButtonAudio)
	call_deferred("_change_scene")
	
func _change_scene():
	GlobalVars.player_drank_water = false
	GlobalVars.player_have_fuse = false
	GlobalVars.Player_ate_fruit = false
	GlobalVars.player_have_key = false
	GlobalVars.board_collision = false

	get_tree().change_scene_to_file("res://Scenes/main.tscn")
