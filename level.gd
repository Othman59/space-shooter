extends Node2D

@onready var score_label = $UI/ScoreLabel
@onready var game_over_ui = $GameOver
@onready var music = $Music
@onready var game_over_sound = $GameOverSound
@onready var player = $Player

var score = 0
var is_player_alive = true

func _ready():
	# Lancer la musique
	if music:
		music.play()
	
	# Cacher l'écran Game Over au début
	game_over_ui.visible = false
	
	# Connecter le signal du joueur
	if player:
		player.dead.connect(_on_player_dead)

func _on_timer_timeout() -> void:
	if is_player_alive:
		score += 1
		score_label.text = "Score: " + str(score)

func _on_player_dead() -> void:
	print("GAME OVER déclenché")
	
	is_player_alive = false
	game_over_ui.visible = true
	
	# Baisser la musique
	if music:
		music.volume_db = -20
	
	# Jouer le son Game Over
	if game_over_sound:
		game_over_sound.play()
