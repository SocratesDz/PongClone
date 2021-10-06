extends Control

onready var globals = $"/root/Globals"

func _input(event) -> void:
	if event.is_action_pressed("exit"):
		if get_tree().paused:
			_unpause_and_hide()
		else:
			_pause_and_show()

func _unpause_and_hide() -> void:
	_unpause()
	hide()
	print("pause screen closed")
	
func _pause_and_show() -> void:
	show()
	_pause()
	print("pause screen shown")

func _on_Continue_pressed() -> void:
	_unpause_and_hide()


func _on_GoToMainMenu_pressed() -> void:
	_unpause()
	globals.show_main_menu()


func _pause():
	get_tree().set_deferred("paused", true)

func _unpause():
	get_tree().paused = false


func _on_Continue_toggled(button_pressed):
	print("toggled " + str(button_pressed))
