extends Node2D

@onready var score_label = $UI/ScoreLabel
@onready var game_over_ui = $GameOver

var score = 0
var is_player_alive = true

func _on_timer_timeout() -> void:
	if is_player_alive:
		score += 1
		score_label.text = "score: " + str(score)

func _on_player_dead() -> void:
	is_player_alive = false
	game_over_ui.visible = true
