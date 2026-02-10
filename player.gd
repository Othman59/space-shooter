extends CharacterBody2D

signal dead

@export var speed := 500

func _physics_process(delta):
	#Movements
	velocity = Vector2.ZERO

	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	if Input.is_action_pressed("move_top"):
		velocity.y -= speed
	if Input.is_action_pressed("move_down"):
		velocity.y += speed

	move_and_slide()
	
	#Limit Position
	
	var screen_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0,0), screen_size)
	
func death():
	dead.emit()
	queue_free()
