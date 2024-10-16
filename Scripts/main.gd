extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_zombie_starts_following_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("Zombie can follow")
		GlobalSignal.emit_signal("zombie_can_follow")
