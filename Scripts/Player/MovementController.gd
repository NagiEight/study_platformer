extends CharacterBody2D

var speed
const gravity = 1200
const jumpForce = -500
const jumpHoldTime = .3
const extraGravity = 2000

var jump_time = 0.0
var is_jumping = false

func _ready() -> void:
	pass

func _physics_process(delta):
	var focused = get_viewport().gui_get_focus_owner()
	if focused is TextEdit or focused is LineEdit:
		return
	
	speed = 512
	if Input.is_action_pressed("sprint"):
		speed = 1024
	
	var MoveDirection = Input.get_action_strength("moveRight") - Input.get_action_strength("moveLeft")
	velocity.x = MoveDirection * speed
	
	if not is_on_floor():
		if is_jumping and Input.is_action_pressed("jump") and jump_time < jumpHoldTime:
			jump_time += delta  
		else:
			velocity.y += extraGravity * delta
			is_jumping = false
	else:
		velocity.y = 0
		jump_time = 0
		is_jumping = false

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jumpForce
		is_jumping = true
	
	move_and_slide()
