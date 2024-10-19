extends CharacterBody2D

@export var speed = 50

@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

var audio_time = 5

func _ready() -> void:
	$ZombieSprite.hide()
	$CollisionShape.disabled = true
	$Area2D/CollisionShape2D.disabled = true
	$AudioArea/CollisionShape2D.disabled = true
	GlobalSignal.zombie_can_follow.connect(_zombie_can_follow)
	GlobalSignal.zombie_died.connect(_zombie_died)
	

func _zombie_died():
	$Audio.playing = true
	await($Audio)
	GlobalSignal.emit_signal("text", "Now i should go back to bed..")
	#$DiedTimer.start()
	queue_free()

func _zombie_can_follow():
	$Audio.playing = true
	$ZombieSprite.show()
	$ZombieSprite.play("chasing")
	await($Audio)
	call_deferred("_show_collision")
	$Timer.start()
	$AudioTimer.start()


func _show_collision():
	$CollisionShape.disabled = false
	$Area2D/CollisionShape2D.disabled = false
	$AudioArea/CollisionShape2D.disabled = false
	

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
		call_deferred("_change_scene")
		
func _change_scene():
	get_tree().change_scene_to_file("res://Scenes/game_over.tscn")

func _audio():
	if audio_time == 3:
		GlobalSignal.emit_signal("key", "Where is that weird noise coming from?")
	elif audio_time == 0:
		GlobalSignal.emit_signal("key", "")
		$AudioTimer.stop()
		
	
	print(audio_time)


func _on_audio_timer_timeout() -> void:
	audio_time -= 1
	_audio()


func _on_audio_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if $Audio.playing:
			await $Audio.finished
			$Audio.play()
		else:
			$Audio.play()
		
