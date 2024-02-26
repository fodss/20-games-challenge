extends Node2D

@onready var center_sprite = $Sprites/CenterSprite
@onready var left_sprite = $Sprites/LeftSprite
@onready var right_sprite = $Sprites/RightSprite

@onready var left_touch_button = $"../LeftTouchButton"
@onready var right_touch_button = $"../RightTouchButton"

var isCollidingL: bool = false
var isCollidingR: bool = false

const SPEED: int = 125

func _ready():
	left_sprite.frame = AutoloadGlobal.paddleColor
	center_sprite.frame = AutoloadGlobal.paddleColor
	right_sprite.frame = AutoloadGlobal.paddleColor

func _process(delta):
	var input_axis = Input.get_axis("ui_left", "ui_right")
	get_input(input_axis, delta)

func get_input(input_axis, delta):
	var velocity = (input_axis * SPEED) * delta
	if input_axis == -1 && isCollidingL == false:
		position.x += velocity
	if input_axis == 1 && isCollidingR == false:
		position.x += velocity


func _on_left_area_entered(area):
	if area.is_in_group("LeftBorder"):
		isCollidingL = true

func _on_left_area_exited(area):
	if area.is_in_group("LeftBorder"):
		isCollidingL = false

func _on_right_area_entered(area):
	if area.is_in_group("RightBorder"):
		isCollidingR = true

func _on_right_area_exited(area):
	if area.is_in_group("RightBorder"):
		isCollidingR = false
