class_name ResultScreen
extends Control

onready var globals = $"/root/Globals"
onready var resultLabel = $Control/Result

var player_name = ""

func _process(delta):
	resultLabel.text = player_name + " WON"

func _on_PlayAgainBtn_pressed():
	get_tree().reload_current_scene()


func _on_MainMenuBtn_pressed():
	get_tree().paused = false
	globals.show_main_menu()
