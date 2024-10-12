extends AnimatedSprite2D


var speed = 100
var direction := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	
	if Input.is_action_pressed("up"):
		direction.y -= speed
	
	if Input.is_action_pressed("down"):
		direction.y += speed
	
	if Input.is_action_pressed("left"):
		direction.x -= speed
	
	if Input.is_action_pressed("right"):
		direction.x += speed
	
	
	
