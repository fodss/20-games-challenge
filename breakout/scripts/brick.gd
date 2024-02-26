extends Area2D

@export var healthPoints: int = 3
@onready var animated_sprite_2d = $AnimatedSprite2D
var isHurt: bool = false

func _process(delta):
	check_health()

func check_health():
	if healthPoints == 3:
		animated_sprite_2d.animation = "full"
		animated_sprite_2d.frame = 1
	if healthPoints == 2:
		animated_sprite_2d.animation = "mid"
		animated_sprite_2d.frame = 1
	if healthPoints == 1:
		animated_sprite_2d.animation = "low"
		animated_sprite_2d.frame = 1
	if healthPoints == 0:
		AutoloadGlobal.playerScore += 100
		queue_free()

func _on_area_entered(area):
	if area.is_in_group("Ball") && isHurt == false:
		healthPoints -= 1
		isHurt = true
		AutoloadGlobal.hurtBrick = true

func _on_area_exited(area):
	if area.is_in_group("Ball") && isHurt == true:
		isHurt = false
