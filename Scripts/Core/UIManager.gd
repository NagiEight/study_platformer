extends CanvasLayer

var health_bar : TextureProgressBar
var inventory_panel : Control
var dialogue_box : Label
var pause_menu : Control
var minimap_icon : Node2D
var popup_label : Label

func _ready():
	# Assign references (update paths to match your scene hierarchy)
	health_bar = get_node("HUD/HealthBar")
	inventory_panel = get_node("HUD/InventoryPanel")
	dialogue_box = get_node("HUD/DialogueBox")
	pause_menu = get_node("HUD/PauseMenu")
	minimap_icon = get_node("HUD/Minimap/PlayerIcon")
	popup_label = get_node("HUD/PopupMessage")

func UpdateHealthBar(current : float, max : float) -> void:
	health_bar.value = current
	health_bar.max_value = max

func ShowInventory(items : Array) -> void:
	inventory_panel.clear()
	for item in items:
		var entry = Label.new()
		entry.text = str(item)
		inventory_panel.add_child(entry)

func DisplayDialogue(text : String) -> void:
	dialogue_box.text = text
	dialogue_box.visible = true
	await (get_tree().create_timer(3))
	dialogue_box.visible = false

func TogglePauseMenu(show : bool) -> void:
	pause_menu.visible = show
	get_tree().paused = show

func UpdateMinimap(player_position : Vector2) -> void:
	minimap_icon.global_position = player_position

func ShowPopup(message : String) -> void:
	popup_label.text = message
	popup_label.visible = true
	await(get_tree().create_timer(2))
	popup_label.visible = false
