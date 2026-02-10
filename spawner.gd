extends Node2D

@onready var markers = $Markers

func _on_timer_timeout() -> void:
	var random_point = markers.get_children().pick_random()
	
	var asteroid_scene = preload ("res://asteroid.tscn")
	var asteroid = asteroid_scene.instantiate()
	asteroid.global_position = random_point.global_position
	get_parent().add_child(asteroid)
