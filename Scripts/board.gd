extends StaticBody2D





func _on_board_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if GlobalVars.player_have_fuse == true:
			GlobalSignal.emit_signal("text", "Electricity is Back")
			print("Electricity is Back")
		else:
			GlobalSignal.emit_signal("text", "Search for the circuit breaker")
			print("get the fuse")
		
