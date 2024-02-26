extends Node2D

@export var ball_tscn: PackedScene
@onready var timer = $Timer
@onready var goal_text = $GoalText

func _process(delta):
	if GlobalSettings.ballExists == false and timer.is_stopped():
		timer.start(4)
		goal_text.visible = true

func spawn_ball():
	var new_ball = ball_tscn.instantiate()
	self.add_sibling(new_ball)
	new_ball.position = Vector2(540,360)

func _on_left_goal_area_entered(area):
	if area.is_in_group("ball"):
		if GlobalSettings.soundOn:
			$goalSound.play()

func _on_right_goal_area_entered(area):
	if area.is_in_group("ball"):
		if GlobalSettings.soundOn:
			$goalSound.play()
