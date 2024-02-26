extends Node2D

@onready var main = $"."

@onready var left_collision = $LeftBorder/LeftCollision
@onready var left_polygon_2d = $LeftBorder/LeftCollision/Polygon2D

@onready var right_collision = $RightBorder/RightCollision
@onready var right_polygon_2d = $RightBorder/RightCollision/Polygon2D

@onready var top_collision = $TopBorder/TopCollision
@onready var top_polygon_2d = $TopBorder/TopCollision/Polygon2D

@onready var paddle = $Paddle

@onready var score_label = $ScoreLabel

@onready var lives_animated_sprite = $LivesAnimatedSprite

@onready var space_label = $SpaceLabel

@onready var menu_text = $MenuText

@onready var win_label = $MenuText/WinLabel
@onready var play_again_label = $MenuText/PlayAgainLabel

@onready var game_over_label = $MenuText/GameOverLabel
@onready var try_again_label = $MenuText/TryAgainLabel

@onready var exit_button = $MenuText/ExitButton
@onready var restart_button = $MenuText/RestartButton


func _ready():
	get_tree().set_current_scene(main)
	
	left_polygon_2d.polygon = left_collision.polygon
	right_polygon_2d.polygon = right_collision.polygon
	top_polygon_2d.polygon = top_collision.polygon
	
	AutoloadGlobal.playerLives = 3
	AutoloadGlobal.playerScore = 0
	
	menu_text.visible = false
	win_label.visible = false
	play_again_label.visible = false
	game_over_label.visible = false
	try_again_label.visible = false
	
	exit_button.disabled = true
	restart_button.disabled = true
	
	space_label.visible = true
	

func _process(delta):
	score_label.text = "SCORE: " + str(AutoloadGlobal.playerScore)
	
	game_win()
	
	if AutoloadGlobal.playerLives == 3:
		lives_animated_sprite.set_animation("3hp")
	if AutoloadGlobal.playerLives == 2:
		lives_animated_sprite.set_animation("2hp")
	if AutoloadGlobal.playerLives == 1:
		lives_animated_sprite.set_animation("1hp")
	if AutoloadGlobal.playerLives == 0:
		lives_animated_sprite.set_animation("0hp")
		game_over()

	if AutoloadGlobal.isBallAttached:
		space_label.visible = true
	if AutoloadGlobal.isBallAttached == false:
		space_label.visible = false

	if AutoloadGlobal.ballExists == false:
		paddle.position.x = 270

func game_over():
	menu_text.visible = true
	game_over_label.visible = true
	try_again_label.visible = true
	exit_button.disabled = false
	restart_button.disabled = false
	space_label.visible = false

func game_win():
	if AutoloadGlobal.playerScore >= 12800:
		menu_text.visible = true
		win_label.visible = true
		play_again_label.visible = true
		exit_button.disabled = false
		restart_button.disabled = false
		space_label.visible = false

func _on_exit_button_button_up():
	get_tree().quit()

func _on_restart_button_button_up():
	get_tree().reload_current_scene()
