extends CheckButton

func _process(delta):
	if self.button_pressed == true:
		GlobalSettings.soundOn = true
	if self.button_pressed == false:
		GlobalSettings.soundOn = false
