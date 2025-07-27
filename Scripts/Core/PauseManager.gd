extends Control



func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed() and not event.is_echo():
		IsPausePressed()

func IsPausePressed() -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		if GameManager.GetCurrentState() != GameManager.GameState.Paused:
			GameManager.PauseGame()
		else:
			GameManager.ResumeGame()
