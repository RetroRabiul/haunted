extends StaticBody2D

var time = 5

func _process(delta: float) -> void:
	if time == 0:
		GlobalSignal.emit_signal("key", "")
	print(time)


func _on_board_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if GlobalVars.player_have_fuse == true and GlobalVars.Player_ate_fruit == true:
			GlobalSignal.emit_signal("text", "Electricity is Back")
			GlobalSignal.emit_signal("have_electricity")
			print("Electricity is Back")
		elif GlobalVars.player_drank_water == false:
			GlobalSignal.emit_signal("key", "But first of all")
			$Timer.start()
		else:
			GlobalSignal.emit_signal("text", "I need to Search for a new fuse")
			GlobalSignal.emit_signal("zombie_can_follow")
			print("get the fuse")
		



func _on_timer_timeout() -> void:
	time -= 1
