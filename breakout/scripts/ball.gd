extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var paddle = $"../Paddle"

const SPEED: int = 100

var ballDirectionY = -SPEED
var ballDirectionX = 0
var hasCollided: bool = false

@onready var timer = $Timer
@onready var brick_timer = $BrickTimer

var processed_collisions = []

func _ready():
	AutoloadGlobal.ballExists = true
	animated_sprite_2d.frame = AutoloadGlobal.ballColor
	AutoloadGlobal.isBallAttached = true

func _process(delta):
	processed_collisions = []
	
	if AutoloadGlobal.isBallAttached:
		self.position.x = paddle.position.x
		if Input.is_action_just_released("ui_accept"):
			AutoloadGlobal.isBallAttached = false
	if AutoloadGlobal.isBallAttached == false:
		ball_movement(delta)

func ball_movement(delta):
	#position.y += ballDirection * delta
	#position.x += ballDirectionX * delta
	position += Vector2(ballDirectionX * delta, ballDirectionY * delta)

func _on_area_entered(area):
	if area.is_in_group("LeftBorder"):
		ballDirectionX *= -1
	if area.is_in_group("RightBorder"):
		ballDirectionX *= -1
	if area.is_in_group("TopBorder"):
		ballDirectionY *= -1

	if area.is_in_group("BottomBorder"):
		AutoloadGlobal.playerLives -= 1
		AutoloadGlobal.ballExists = false
		self.queue_free()

	if area.is_in_group("BrickTop") and "Top" not in processed_collisions:
		ballDirectionY *= -1
		processed_collisions.append("Top")
	if area.is_in_group("BrickBot") and "Bot" not in processed_collisions:
		ballDirectionY *= -1
		processed_collisions.append("Bot")
	if area.is_in_group("BrickRight") and "Right" not in processed_collisions:
		ballDirectionX *= -1
		processed_collisions.append("Right")
	if area.is_in_group("BrickLeft") and "Left" not in processed_collisions:
		ballDirectionX *= -1
		processed_collisions.append("Left")

	if area.is_in_group("LeftPaddle"):
		if AutoloadGlobal.ballCollision:
			return
		else:
			AutoloadGlobal.ballCollision = true
			ballDirectionY *= -1
			ballDirectionX = -SPEED
	if area.is_in_group("RightPaddle"):
		if AutoloadGlobal.ballCollision:
			return
		else:
			AutoloadGlobal.ballCollision = true
			ballDirectionY *= -1
			ballDirectionX = SPEED
	if area.is_in_group("CenterPaddle"):
		if AutoloadGlobal.ballCollision:
			return
		else:
			AutoloadGlobal.ballCollision = true
			ballDirectionY *= -1
			ballDirectionX = 0

func _on_area_exited(area):
	if AutoloadGlobal.ballCollision == true:
		timer.start()
		await timer.timeout
		AutoloadGlobal.ballCollision = false
