extends Area2D

var time = 5

func _ready() -> void:
	$Icon.play("icon")
	$Table.play("idle")


func _process(delta: float) -> void:
	if time == 0:
		GlobalSignal.emit_signal("key", "")
		time = 5
	



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if GlobalVars.player_have_key == true:
			$Audio.playing = true
			await($Audio)
			GlobalVars.player_have_key == false
			GlobalVars.player_have_fuse = true
			$Icon.hide()
			$Table.play("opened")
			GlobalSignal.emit_signal("text", "I got the fuse")
			$CollisionShape2D.set_deferred("disabled", true)
			print(GlobalVars.player_have_fuse)
			
		elif GlobalVars.board_collision == true and GlobalVars.player_have_key == false:
			GlobalSignal.emit_signal("key", "It's locked..I need a key")
			GlobalSignal.emit_signal("text", "I need to search for a key")
			$Timer.start()
		else:
			GlobalSignal.emit_signal("key", "It's locked..I need a key")
			$Timer.start()


func _on_timer_timeout() -> void:
	time -= 1
