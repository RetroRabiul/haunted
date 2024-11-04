extends CharacterBody2D

@export var speed = 100
var direction := Vector2.ZERO

var array = []


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
	var last_direction = array.size() - 1
	
	if Input.is_action_just_pressed("up"):
		array.append("up")
		#index += 1
		#if index > array.size() - 1:
			#index = 0
	
	if Input.is_action_just_released("up"):
		if "up" in array:
			array.erase("up")
	
	if "up" in ["Left", "right", "up", "down"]:
		direction.y = -1
		$PlayerSprite.play("back")
	
	
	if Input.is_action_just_pressed("down"):
		array.append("down")
		
	if Input.is_action_just_released("down"):
		if "down" in array:
			array.erase("down")
		
	if "down" in ["Left", "right", "up", "down"]:
		direction.y = 1
		$PlayerSprite.play("front")
		
	
	if Input.is_action_just_pressed("left"):
		array.append("left")
		
	if Input.is_action_just_released("left"):
		if "left" in array:
			array.erase("left")
		
	if "left" in ["Left", "right", "up", "down"]:
		direction.x = -1
		$PlayerSprite.flip_h = true
		$PlayerSprite.play("walking")
		
	
	
	if Input.is_action_just_pressed("right"):
		array.append("right")
		
	if Input.is_action_just_released("right"):
		if "right" in array:
			array.erase("right")
		
	if "right" in ["Left", "right", "up", "down"]:
		direction.x = 1
		$PlayerSprite.play("walking")
		$PlayerSprite.flip_h = false
		
	
	
	#else:
		#$PlayerSprite.play("idle")
	print(array)
	
	velocity = direction * speed
	velocity.normalized()
#func _physics_process(delta: float) -> void:
	#velocity = direction * speed
	move_and_slide()
