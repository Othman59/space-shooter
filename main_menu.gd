extends Control

@onready var animation_player = get_node_or_null("AnimationPlayer")
@onready var menu_music = get_node_or_null("MenuMusic")


func _ready():
	if animation_player:
		animation_player.play("TitlePulse")
		
	if menu_music:
		menu_music.play()

func _on_button_pressed() -> void:
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0, 0.5)
	await tween.finished
	get_tree().change_scene_to_file("res://level.tscn")
	
func _on_button_2_pressed() -> void:
	get_tree().quit()
	
