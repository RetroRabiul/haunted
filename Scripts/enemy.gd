extends CharacterBody2D

const speed = 50

@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _ready() -> void:
	$ZombieSprite.play("chasing")
	GlobalSignal.zombie_can_follow.connect(_zombie_can_follow)


func _zombie_can_follow():
	$Timer.start()




func _physics_process(delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()


func makepath() -> void:
	nav_agent.target_position = player.global_position
	



func _on_timer_timeout() -> void:
	makepath()




















#@export var max_speed = 200
#@export var player_path = NodePath()
#@onready var player = get_node(player_path)
#
#@onready var nav_agent = $NavigationAgent2D
#
#var is_chasing = false
#
#
#func _ready() -> void:
	#nav_agent.get_next_path_position(player.global_position)
	#chase_player(true)
#
#
#func chase_player(state):
	#is_chasing = state
#
#
#func _physics_process(delta: float) -> void:
	#
	#var direction = global_position.direction_to(nav_agent.get_next_path_position())
	#var new_velocity = direction * max_speed
	#
	#var steering = (new_velocity - velocity) * delta * 400.0
	#
	#velocity += steering
	#
	#move_and_slide()
	#
	#
	#
	#
	#
#
#
#
#










#@export var speed = 200
#var player_chase = false
#
#var player = null
#
#func _physics_process(delta: float) -> void:
	#if player_chase:
		#position += (player.position - position) / speed
		#
#
#func _on_area_2d_body_entered(body: Node2D) -> void:
	#player = body
	#player_chase = true
#
#func _on_area_2d_body_exited(body: Node2D) -> void:
	#player = null
	#player_chase = false
