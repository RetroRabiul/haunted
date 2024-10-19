extends StaticBody2D

var cansleep : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignal.zombie_died.connect(_sleep)

func _sleep():
	cansleep = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_sleeping_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if cansleep:
			call_deferred("_change_scene")
	
func _change_scene():
		get_tree().change_scene_to_file("res://Scenes/survived.tscn")
