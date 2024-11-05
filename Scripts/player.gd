extends CharacterBody2D

@export var speed = 100
var direction := Vector2.ZERO

var array = []
var move_in_this_direction

func _ready() -> void:
	$PointLight2D.visible = false
	GlobalSignal.have_electricity.connect(_have_electricity)
	GlobalSignal.torch_collected.connect(_torch_collected)

func _have_electricity():
	$PointLight2D.hide()

func _torch_collected() -> void:
	$PointLight2D.show()

func _process(delta: float) -> void:
	#direction = Input.get_vector("left", "right", "up", "down")
	#print(global_position)
	#direction.x = 0
	#direction.y = 0
	direction = Vector2.ZERO
	
	#var last_direction = array[array.length - 1]
	#var last_direction = array.size() - 1
	#var last_direction = array.size() - 1
	
	
	
	if Input.is_action_just_pressed("up"):
		array.append("up")
		#if "up" in move_in_this_direction:
			#direction.y = -1
			#$PlayerSprite.play("back")
		#index += 1
		#if index > array.size() - 1:
			#index = 0
	
	if Input.is_action_just_released("up"):
		if "up" in array:
			array.erase("up")
	
	
	
	
	if Input.is_action_just_pressed("down"):
		array.append("down")
		#if "down" in move_in_this_direction:
			#direction.y = 1
			#$PlayerSprite.play("front")
		
	if Input.is_action_just_released("down"):
		if "down" in array:
			array.erase("down")
		
	
	
	if Input.is_action_just_pressed("left"):
		array.append("left")
		#if "left" in move_in_this_direction:
			#direction.x = -1
			#$PlayerSprite.flip_h = true
			#$PlayerSprite.play("walking")
		
	if Input.is_action_just_released("left"):
		if "left" in array:
			array.erase("left")
		
	
		
	
	
	if Input.is_action_just_pressed("right"):
		array.append("right")
		#if "right" in move_in_this_direction:
			#direction.x = 1
			#$PlayerSprite.play("walking")
			#$PlayerSprite.flip_h = false
		
	if Input.is_action_just_released("right"):
		if "right" in array:
			array.erase("right")
		
	
	#else:
		#$PlayerSprite.play("idle")
	print(array)
	
	
	if not array.is_empty():
		var last_direction = array.size() - 1
		move_in_this_direction = array[last_direction]
		
		print ("MOVE TO ", move_in_this_direction)
	else:
		move_in_this_direction = "stop"
	
	
	
	match move_in_this_direction:
		"up":
			direction.y = -1
			$PlayerSprite.play("back")
		"down":
			direction.y = 1
			$PlayerSprite.play("front")
		"left":
			direction.x = -1
			$PlayerSprite.flip_h = true
			$PlayerSprite.play("walking")
		"right":
			direction.x = 1
			$PlayerSprite.play("walking")
			$PlayerSprite.flip_h = false
		"stop":
			$PlayerSprite.play("idle")
	
	
	
	
	#
	#if move_in_this_direction == "up":
			#direction.y = -1
			#$PlayerSprite.play("back")
	#
	#if move_in_this_direction == "down":
			#direction.y = 1
			#$PlayerSprite.play("front")
	#
	#if move_in_this_direction == "left":
			#direction.x = -1
			#$PlayerSprite.flip_h = true
			#$PlayerSprite.play("walking")
	#
	#if move_in_this_direction == "right":
			#direction.x = 1
			#$PlayerSprite.play("walking")
			#$PlayerSprite.flip_h = false
	#
	#if move_in_this_direction == "stop":
		#$PlayerSprite.play("idle")
	#
	
	velocity = direction * speed
	velocity.normalized()
#func _physics_process(delta: float) -> void:
	#velocity = direction * speed
	move_and_slide()
