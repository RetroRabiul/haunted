extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Apple.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and GlobalVars.player_drank_water == true:
		$Apple.hide()
		GlobalVars.Player_ate_fruit = true
		GlobalSignal.emit_signal("text","I need to Search for the Fuse box")
	
