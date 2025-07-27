extends Area2D

var passwordField: LineEdit
var door: StaticBody2D
var doorDisplay: Sprite2D
var doorCollision: CollisionShape2D
var password

const doorPassword = "NagiEight"

func _ready() -> void:
	passwordField = $LineEdit
	changeTextboxState(false)
	set_monitoring(true)
	
	door = get_node("../Door")
	doorDisplay = door.get_node("Icon")
	doorCollision = door.get_node("CollisionShape2D")

func _on_area_entered(area: Area2D) -> void:
	if Input.is_action_just_pressed("interact"):
		if passwordField.visible:
			changeTextboxState(false)
			password = passwordField.text
			if password == doorPassword:
				doorDisplay.visible = false
				doorCollision.disabled = true
			else:
				doorDisplay.visible = true
				doorCollision.disabled = false
		else:
			changeTextboxState(true)
			passwordField.grab_focus()
				
	if  Input.is_action_just_pressed("cancel"):
		changeTextboxState(false)
		passwordField.text = ""

func _process(delta: float) -> void:
	var overlapping = get_overlapping_areas()
	for area in overlapping:
		_on_area_entered(area)

func changeTextboxState(state: bool):
	passwordField.visible = state
	passwordField.editable = state
