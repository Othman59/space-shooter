extends CharacterBody2D

signal dead

@export var speed := 500
@onready var projectile_scene = preload("res://projectile.tscn")
@onready var shooting_point = $ShottingPoint
@onready var shoot_sound = $ShootSound   # AudioStreamPlayer2D pour le tir

@warning_ignore("unused_parameter")
func _physics_process(delta):
	# Movements
	velocity = Vector2.ZERO

	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	if Input.is_action_pressed("move_top"):
		velocity.y -= speed
	if Input.is_action_pressed("move_down"):
		velocity.y += speed
		
	# Tir
	if Input.is_action_just_pressed("shotting"):
		var projectile_instance = projectile_scene.instantiate()
		projectile_instance.global_position = shooting_point.global_position
		projectile_instance.rotation = rotation
		get_parent().add_child(projectile_instance)
		
		# 🎵 Jouer le son
		shoot_sound.play()
		
	# Déplacement du joueur
	move_and_slide()
	
	# Limite de position à l'écran
	var screen_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0,0), screen_size)
	
func death():
	dead.emit()
	queue_free()
