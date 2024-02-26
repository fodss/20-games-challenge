extends Node2D

@export var ball_tscn: PackedScene
@onready var paddle = $"../Paddle"

func spawn_ball():
	var new_ball = ball_tscn.instantiate()
	self.add_sibling(new_ball)
	new_ball.position = Vector2(paddle.position.x, 327)

func _process(delta):
	if AutoloadGlobal.ballExists == false && AutoloadGlobal.playerLives > 0:
		spawn_ball()
