extends CharacterBody2D

@export var speed = 50

@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D



func _ready() -> void:
	$ZombieSprite.hide()
	$CollisionShape.hide()
	GlobalSignal.zombie_can_follow.connect(_zombie_can_follow)


func _zombie_can_follow():
	$ZombieSprite.show()
	$CollisionShape.show()
	$Timer.start()


func _physics_process(delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()


func makepath() -> void:
	nav_agent.target_position = player.global_position
	


func _on_timer_timeout() -> void:
	makepath()
