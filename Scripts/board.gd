extends StaticBody2D

var time = 5

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if time == 0:
		GlobalSignal.emit_signal("key", "")
	print(time)


func _on_board_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if GlobalVars.player_have_fuse == true :
			GlobalSignal.emit_signal("text", "Electricity is Back")
			GlobalSignal.emit_signal("have_electricity")
			print("Electricity is Back")
			
		elif GlobalVars.board_collision == true:
			GlobalSignal.emit_signal("show_key")
			GlobalSignal.emit_signal("text", "I need to Search for a new fuse")
			print("get the fuse")
		
		else:
			GlobalSignal.emit_signal("key", "Not Now....")
			$Timer.start()
		


func _on_timer_timeout() -> void:
	time -= 1
