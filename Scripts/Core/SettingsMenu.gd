extends Control
var InputHandler = load("res://Scripts/Core/InputHandler.gd")

func _ready():
	$SettingsContainer/AudioSection/VolumeSlider.value_changed.connect(_on_volume_changed)
	$SettingsContainer/ControlSection/OptionButton.item_selected.connect(_on_scheme_selected)
	$SettingsContainer/BackButton.pressed.connect(_on_back_pressed)

func _on_volume_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))
	print("Master volume set to: ", value)

func _on_scheme_selected(index):
	match index:
		0: InputHandler.SwitchControlScheme(InputHandler.InputType.KEYBOARD)
		1: InputHandler.SwitchControlScheme(InputHandler.InputType.GAMEPAD)
	print("Control scheme updated")

func _on_back_pressed():
	hide()
	get_tree().paused = false  # If this is part of a pause menu
