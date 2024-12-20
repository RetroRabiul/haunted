extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Apple.show()
	$Icon.show()
	$Icon.play("icon")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and GlobalVars.player_drank_water == true:
		$Audio.playing = true
		await($Audio)
		$Apple.hide()
		$Icon.hide()
		$CollisionShape2D.set_deferred("disabled", true)
		GlobalVars.Player_ate_fruit = true
		GlobalVars.board_collision = true
		GlobalSignal.emit_signal("text","I need to search for the Fuse box")
	
