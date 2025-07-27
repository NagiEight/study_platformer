extends Control

@export var UIManager = preload("res://Scripts/Core/UIManager.gd").new()
func _ready():
	$Buttons/StartButton.pressed.connect(_on_start_pressed)
	$Buttons/SettingsButton.pressed.connect(_on_settings_pressed)
	$Buttons/QuitButton.pressed.connect(_on_quit_pressed)

func _on_start_pressed():
	GameManager.StartGame()

func _on_settings_pressed():
	UIManager.ShowSettings()

func _on_quit_pressed():
	get_tree().quit()
