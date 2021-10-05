extends Control

onready var gameScene = preload("res://scenes/Court.tscn")

func _on_StartButton_pressed() -> void:
	# warning-ignore:return_value_discarded
	get_tree().change_scene_to(gameScene)

func _on_ExitButton_pressed() -> void:
	get_tree().quit()
