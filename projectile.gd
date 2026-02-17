extends Area2D

var speed = 25
@onready var collision_sound = $CollisionSound

func _physics_process(delta):
	global_position.x += speed

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	# Jouer le son de collision
	if collision_sound:
		collision_sound.play()

	# Désactiver collisions pour éviter double déclenchement
	set_deferred("monitoring", false)
	$CollisionShape2D.set_deferred("disabled", true)

	# Cacher le sprite
	if has_node("Sprite2D"):
		$Sprite2D.hide()

	# Si l'objet touché a une méthode dead
	if area.has_method("dead"):
		area.dead()

	# Attendre la fin du son avant suppression
	await collision_sound.finished
	queue_free()
