extends Area2D

var time = 5

func _ready() -> void:
	$Icon.play("icon")
	$Table.play("idle")


func _process(delta: float) -> void:
	if time == 0:
		GlobalSignal.emit_signal("key", "")
	



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if GlobalVars.player_have_key == true:
			GlobalVars.player_have_fuse = true
			$Icon.hide()
			$Table.play("opened")
			GlobalSignal.emit_signal("text", "i got the fuse")
			print(GlobalVars.player_have_fuse)
		else:
			GlobalSignal.emit_signal("key", "it's locked..i need a key")
			$Timer.start()
	


func _on_timer_timeout() -> void:
	time -= 1
