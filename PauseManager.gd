extends Control

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed() and not event.is_echo():
		IsPausePressed()

func IsPausePressed() -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		print("escape")
		HUD.TogglePauseMenu(!get_tree().paused)
