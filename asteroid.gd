extends Area2D

var speed = 250

func _physics_process(delta):
	global_position.x -= speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("death"):
		body.death()
	queue_free()
