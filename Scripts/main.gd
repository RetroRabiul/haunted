extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasModulate.visible = true
	GlobalSignal.have_electricity.connect(_have_electricity)


func _have_electricity():
	$CanvasModulate.visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_zombie_can_follow_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalSignal.emit_signal("zombie_can_follow")
		$ZombieCanFollow.queue_free()
