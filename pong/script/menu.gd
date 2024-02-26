extends Node2D

var GameScene = preload("res://scenes/main.tscn").instantiate()

func _on_single_player_button_up():
	GlobalSettings.gameType = 1
	self.add_sibling(GameScene)
	self.queue_free()

func _on_multi_player_button_up():
	GlobalSettings.gameType = 2
	self.add_sibling(GameScene)
	self.queue_free()
