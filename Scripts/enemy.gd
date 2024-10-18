extends CharacterBody2D

@export var speed = 50

@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D


func _ready() -> void:
	$ZombieSprite.hide()
	$CollisionShape.disabled = true
	$Area2D/CollisionShape2D.disabled = true
	GlobalSignal.zombie_can_follow.connect(_zombie_can_follow)
	GlobalSignal.zombie_died.connect(_zombie_died)
	

func _zombie_died():
	queue_free()

func _zombie_can_follow():
	$ZombieSprite.show()
	$ZombieSprite.play("chasing")
	call_deferred("_show_collision")
	$Timer.start()


func _show_collision():
	$CollisionShape.disabled = false
	$Area2D/CollisionShape2D.disabled = false


func _physics_process(delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()


func makepath() -> void:
	nav_agent.target_position = player.global_position
	


func _on_timer_timeout() -> void:
	makepath()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		_change_scene()
		
func _change_scene():
	get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
