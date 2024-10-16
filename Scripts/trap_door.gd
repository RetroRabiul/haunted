extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TrapDoor.hide()
	$TrapDoorOpened.hide()
	GlobalSignal.have_electricity.connect(_show_trap)

func _show_trap():
	$TrapDoor.show()
	call_deferred("_show_collision")
	

func _show_collision():
	$CollisionShape2D.disabled = false
	print($CollisionShape2D.disabled)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalSignal.emit_signal("text", "I should move now")
	if body.is_in_group("enemy"):
		GlobalSignal.emit_signal("zombie_died")

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		$TrapDoorOpened.show()
