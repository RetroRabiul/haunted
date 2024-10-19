extends StaticBody2D

var time = 5
var trap_msg = 5

func _ready() -> void:
	$Icon.show()
	$Icon.play("icon")

func _process(delta: float) -> void:
	if time == 0:
		GlobalSignal.emit_signal("key", "")
		$Icon.stop()
	if trap_msg == 0:
		GlobalSignal.emit_signal("text", "I should trap the Zombie in the bashment")
		$Icon.stop()


func _on_board_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if GlobalVars.player_have_fuse == true :
			$TrapMsgTimer.start()
			GlobalVars.player_have_fuse == false
			GlobalSignal.emit_signal("text", "Electricity is Back")
			GlobalSignal.emit_signal("have_electricity")
			$CollisionShape2D.set_deferred("disabled", true)
			$Icon.hide()
			print("Electricity is Back")
			print(GlobalVars.player_have_fuse)
		elif GlobalVars.board_collision == true:
			GlobalSignal.emit_signal("show_key")
			GlobalSignal.emit_signal("text", "I need to search for a new fuse")
			print("get the fuse")
		
		else:
			GlobalSignal.emit_signal("key", "Not Now....")
			$Timer.start()
		


func _on_timer_timeout() -> void:
	time -= 1


func _on_trap_msg_timer_timeout() -> void:
	trap_msg -= 1
