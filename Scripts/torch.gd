extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Icon.show()
	$Icon.play("icon")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$Audio.playing = true
		await($Audio)
		print("player have the torch")
		queue_free()
		GlobalSignal.emit_signal("torch_collected")
	
