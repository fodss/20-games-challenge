extends Node2D

var speed = GlobalSettings.paddleSpeed

func player_movement():
	if Input.is_action_pressed("player_up"):
		self.position.y -= speed
	if Input.is_action_pressed("player_down"):
		self.position.y += speed

func _process(delta):
	player_movement()
