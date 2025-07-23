extends Camera2D

var target : Node2D = null
var zoom_target : float = 1.0
var shake_time : float = 0.0
var shake_intensity : float = 0.0
var bounds : Rect2 = Rect2()

func _process(delta):
	if target:
		global_position = global_position.lerp(target.global_position, 0.1)
	
	if shake_time > 0:
		shake_time -= delta
		offset = Vector2(
			randf_range(-shake_intensity, shake_intensity),
			randf_range(-shake_intensity, shake_intensity)
		)
	else:
		offset = Vector2.ZERO
	
	zoom = zoom.lerp(Vector2(zoom_target, zoom_target), 0.1)
	
	if bounds.has_area():
		global_position = clamp_to_bounds(global_position)

# 🎯 Attach camera to player
func FollowPlayer(player : Node2D) -> void:
	target = player

# 🔍 Change zoom level gradually
func ApplyZoom(level : float) -> void:
	zoom_target = clamp(level, 0.1, 5.0)

# 💥 Trigger screen shake effect
func ShakeCamera(intensity : float, duration : float) -> void:
	shake_intensity = intensity
	shake_time = duration

# 🕹️ Snap instantly to target position
func SnapToTarget() -> void:
	if target:
		global_position = target.global_position

# ⛓️ Limit camera within level bounds
func SetBounds(level_bounds : Rect2) -> void:
	bounds = level_bounds

func clamp_to_bounds(position : Vector2) -> Vector2:
	var clamped = position
	clamped.x = clamp(position.x, bounds.position.x, bounds.position.x + bounds.size.x)
	clamped.y = clamp(position.y, bounds.position.y, bounds.position.y + bounds.size.y)
	return clamped
