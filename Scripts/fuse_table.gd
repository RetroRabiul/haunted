extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalVars.player_have_fuse = true
		GlobalSignal.emit_signal("text", "You have the circuit breaker")
		print(GlobalVars.player_have_fuse)
		
