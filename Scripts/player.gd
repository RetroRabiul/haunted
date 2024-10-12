extends CharacterBody2D

@export var speed = 100
var direction := Vector2.ZERO
	
func _process(delta: float) -> void:
	#direction = Input.get_vector("left", "right", "up", "down")
	#print(global_position)
	direction.x = 0
	direction.y = 0
	
	if Input.is_action_pressed("up"):
		direction.y = -1
		$PlayerSprite.play("back")
		
	elif Input.is_action_pressed("down"):
		direction.y = 1
		$PlayerSprite.play("front")
		
	elif Input.is_action_pressed("left"):
		direction.x = -1
		$PlayerSprite.play("walking")
		$PlayerSprite.flip_h = true
		
	elif Input.is_action_pressed("right"):
		direction.x = 1
		$PlayerSprite.play("walking")
		$PlayerSprite.flip_h = false
		
	else:
		$PlayerSprite.play("idle")
	
	
	velocity = direction * speed

#func _physics_process(delta: float) -> void:
	#velocity = direction * speed
	move_and_slide()
