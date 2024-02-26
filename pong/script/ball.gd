extends Area2D

var sideSelect: int
var speed = GlobalSettings.ballSpeed
var ballMovementX = speed
var ballMovementY = speed
var ballMovement: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSettings.ballExists = true
	sideSelect = randi_range(0,1)
	
func ball_movement():
	if sideSelect == 0:
		ballMovementX = -speed
		self.position.x += ballMovementX
	if sideSelect == 1:
		ballMovementX = speed
		self.position.x += ballMovementX
	if sideSelect == 2:
		self.position += ballMovement

func _process(delta):
	ball_movement()

func _on_area_entered(area):
	# TOP PADDLES
	if area.is_in_group("topCollision") and self.position.x < 540:
		if sideSelect == 0 or sideSelect == 1:
			sideSelect = 2
		speed += 0.2
		ballMovementX = -speed
		ballMovementY = -speed
		ballMovementX *= -1
		ballMovement = Vector2(ballMovementX, ballMovementY)
		if GlobalSettings.soundOn:
			$paddleHitSound.play()
		
	if area.is_in_group("topCollision") and self.position.x > 540:
		if sideSelect == 0 or sideSelect == 1:
			sideSelect = 2
		speed += 0.2
		ballMovementX = speed
		ballMovementY = -speed
		ballMovementX *= -1
		ballMovement = Vector2(ballMovementX, ballMovementY)
		if GlobalSettings.soundOn:
			$paddleHitSound.play()
		
		# MID PADDLES
	if area.is_in_group("midCollision") and self.position.x < 540:
		if sideSelect == 0 or sideSelect == 1:
			sideSelect = 2
		speed += 0.2
		ballMovementX = -speed
		ballMovementY = 0
		ballMovementX *= -1
		ballMovement = Vector2(ballMovementX, ballMovementY)
		if GlobalSettings.soundOn:
			$paddleHitSound.play()
		
	if area.is_in_group("midCollision") and self.position.x > 540:
		if sideSelect == 0 or sideSelect == 1:
			sideSelect = 2
		speed += 0.2
		ballMovementX = speed
		ballMovementY = 0
		ballMovementX *= -1
		ballMovement = Vector2(ballMovementX, ballMovementY)
		if GlobalSettings.soundOn:
			$paddleHitSound.play()
		
		# BOT PADDLES
	if area.is_in_group("botCollision") and self.position.x < 540:
		if sideSelect == 0 or sideSelect == 1:
			sideSelect = 2
		speed += 0.2
		ballMovementX = -speed
		ballMovementY = speed
		ballMovementX *= -1
		ballMovement = Vector2(ballMovementX, ballMovementY)
		if GlobalSettings.soundOn:
			$paddleHitSound.play()
		
	if area.is_in_group("botCollision") and self.position.x > 540:
		if sideSelect == 0 or sideSelect == 1:
			sideSelect = 2
		speed += 0.2
		ballMovementX = speed
		ballMovementY = speed
		ballMovementX *= -1
		ballMovement = Vector2(ballMovementX, ballMovementY)
		if GlobalSettings.soundOn:
			$paddleHitSound.play()
		
	if area.is_in_group("borders"):
		ballMovementY *= -1
		ballMovement = Vector2(ballMovementX, ballMovementY)
		if GlobalSettings.soundOn:
			$borderHitSound.play()
	
	if area.is_in_group("leftGoal"):
		GlobalSettings.enemyScore += 1
		GlobalSettings.ballExists = false
		self.queue_free()
		
	
	if area.is_in_group("rightGoal"):
		GlobalSettings.playerScore += 1
		GlobalSettings.ballExists = false
		self.queue_free()
		
