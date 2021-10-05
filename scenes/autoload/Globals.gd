extends Node

onready var mainMenuScene = preload("res://scenes/MainMenu.tscn")

func show_main_menu() -> void:
	# warning-ignore:return_value_discarded
	get_tree().change_scene_to(mainMenuScene)
