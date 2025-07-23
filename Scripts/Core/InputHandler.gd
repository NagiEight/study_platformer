extends Node

enum InputType {
	KEYBOARD,
	GAMEPAD
}

var control_scheme : InputType = InputType.KEYBOARD

var move_input := Vector2.ZERO
var jump_pressed := false
var attack_held := false

func _process(delta):
	Update()

# 🟡 Poll input state each frame
func Update():
	move_input = GetMovementInput()
	jump_pressed = IsJumpPressed()
	attack_held = IsAttackHeld()

# 🟢 Return true if jump input is pressed this frame
func IsJumpPressed() -> bool:
	match control_scheme:
		InputType.KEYBOARD:
			return Input.is_action_just_pressed("jump")
		InputType.GAMEPAD:
			return Input.is_action_just_pressed("jump_gamepad")
	return false

# 🔴 Return true if attack button is held down
func IsAttackHeld() -> bool:
	match control_scheme:
		InputType.KEYBOARD:
			return Input.is_action_pressed("attack")
		InputType.GAMEPAD:
			return Input.is_action_pressed("attack_gamepad")
	return false

# 🧭 Get 2D input vector for movement
func GetMovementInput() -> Vector2:
	var dir := Vector2.ZERO
	match control_scheme:
		InputType.KEYBOARD:
			dir.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
			dir.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
		InputType.GAMEPAD:
			dir = Input.get_vector("move_left_gamepad", "move_right_gamepad", "move_up_gamepad", "move_down_gamepad")
	return dir.normalized()

# 🔁 Swap input scheme
func SwitchControlScheme(type : InputType) -> void:
	control_scheme = type
	print("Switched control scheme to: ", type)
