extends Node2D

@onready var center_sprite = $PaddleLabel/Sprites/CenterSprite
@onready var left_sprite = $PaddleLabel/Sprites/LeftSprite
@onready var right_sprite = $PaddleLabel/Sprites/RightSprite

@onready var paddle_left_button = $PaddleLabel/PaddleLeftButton
@onready var paddle_right_button = $PaddleLabel/PaddleRightButton

@onready var ball_sprite = $BallLabel/BallSprite

@onready var ball_left_button = $BallLabel/BallLeftButton
@onready var ball_right_button = $BallLabel/BallRightButton

var GameScene = preload("res://scenes/main.tscn").instantiate()

func _process(delta):
	left_sprite.frame = AutoloadGlobal.paddleColor
	center_sprite.frame = AutoloadGlobal.paddleColor
	right_sprite.frame = AutoloadGlobal.paddleColor
	ball_sprite.frame = AutoloadGlobal.ballColor
	
	if AutoloadGlobal.paddleColor > 0:
		paddle_left_button.disabled = false
	if AutoloadGlobal.paddleColor <= 0:
		paddle_left_button.disabled = true
		
	if AutoloadGlobal.paddleColor < 4:
		paddle_right_button.disabled = false
	if AutoloadGlobal.paddleColor >= 4:
		paddle_right_button.disabled = true

	if AutoloadGlobal.ballColor > 0:
		ball_left_button.disabled = false
	if AutoloadGlobal.ballColor <= 0:
		ball_left_button.disabled = true
		
	if AutoloadGlobal.ballColor < 3:
		ball_right_button.disabled = false
	if AutoloadGlobal.ballColor >= 3:
		ball_right_button.disabled = true

func _on_paddle_left_button_button_up():
	AutoloadGlobal.paddleColor -= 1

func _on_paddle_right_button_button_up():
	AutoloadGlobal.paddleColor += 1

func _on_ball_left_button_button_up():
	AutoloadGlobal.ballColor -= 1

func _on_ball_right_button_button_up():
	AutoloadGlobal.ballColor += 1

func _on_play_button_button_up():
	self.add_sibling(GameScene)
	self.queue_free()
