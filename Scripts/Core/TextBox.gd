extends LineEdit

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		# Ignore mouse button input to prevent focusing
		accept_event()
