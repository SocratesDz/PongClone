extends Popup

func _on_PauseScreen_popup_hide():
	get_tree().paused = false
