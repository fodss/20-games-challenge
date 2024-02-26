extends Node2D

var speed = GlobalSettings.paddleSpeed

func enemy_movement():
	if GlobalSettings.gameType == 2:
		if Input.is_action_pressed("enemy_up"):
			self.position.y -= speed
		if Input.is_action_pressed("enemy_down"):
			self.position.y += speed
	if GlobalSettings.gameType == 1:
		if GlobalSettings.ballExists:
			var ball = $"../Ball"
			if ball.position.y > self.position.y:
					self.position.y += 2
			if ball.position.y < self.position.y:
					self.position.y -= 2

func _process(delta):
	enemy_movement()
