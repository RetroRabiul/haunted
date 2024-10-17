extends Area2D

var time = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if time == 0:
		GlobalSignal.emit_signal("key", "")
		queue_free()
	print(time)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$Timer.start()
		$Key.hide()
		GlobalVars.player_have_key = true
		GlobalSignal.emit_signal("key", "Huh..Retro left his keys again..")
		call_deferred("_hide_collision")
		

func _hide_collision():
	$KeyCollisionShape.disabled = true
	print("time is : "+ str (time))

func _on_timer_timeout() -> void:
	time -= 1
		