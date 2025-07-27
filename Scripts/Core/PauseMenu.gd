extends Control

@export var UIManager = preload("res://Scripts/Core/UIManager.gd").new()

var InputHandler = load("res://Scripts/Core/InputHandler.gd")

func _ready():
	$ButtonsContainer/ContinueButton.pressed.connect(_on_continue_pressed)
	$ButtonsContainer/SettingsButton.pressed.connect(_on_continue_pressed)
	
func _on_continue_pressed():
	hide()
	get_tree().paused = false  # If this is part of a pause menu
