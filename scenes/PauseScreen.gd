extends Popup

onready var globals = $"/root/Globals"

func _input(event) -> void:
	if event.is_action_pressed("exit"):
		if get_tree().paused:
			hide()
			_unpause()
		else:
			popup()
			_pause()

func _on_Continue_pressed() -> void:
	_unpause()
	hide()


func _on_GoToMainMenu_pressed() -> void:
	globals.show_main_menu()


func _pause():
	get_tree().set_deferred("paused", true)

func _unpause():
	get_tree().set_deferred("paused", false)

