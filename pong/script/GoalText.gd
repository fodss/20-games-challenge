extends Label

@onready var timer = $"../Timer"

func _process(delta):
	self.text = str(int(timer.time_left))
	if timer.time_left <= 1:
		self.text = "GO!"
	if timer.time_left == 0:
		self.visible = false
