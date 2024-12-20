extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$GlassAnimatedSprite.play("water")
	$Icon.show()
	$Icon.play("icon")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$Audio.playing = true
		await($Audio)
		$GlassAnimatedSprite.play("empty")
		$Icon.hide()
		call_deferred("_collision")
		GlobalVars.player_drank_water = true
		GlobalSignal.emit_signal("text","I'm hungry, I need to eat something.")


func _collision():
	$Area2D/CollisionShape2D.disabled = true
