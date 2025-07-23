extends Node

enum GameState {
	Menu,
	Gameplay,
	Paused,
	GameOver
}

var current_state : GameState = GameState.Menu

# Called when the node enters the scene tree
func _ready():
	# Initial setup if needed
	SetState(GameState.Menu)

func StartGame():
	SetState(GameState.Gameplay)
	LoadScene("res://Scenes/MainGame.tscn")
	# TODO: Initialize gameplay systems here

func PauseGame():
	SetState(GameState.Paused)
	get_tree().paused = true
	# TODO: Show pause menu UI

func ResumeGame():
	SetState(GameState.Gameplay)
	get_tree().paused = false
	# TODO: Hide pause menu UI

func EndGame():
	SetState(GameState.GameOver)
	# TODO: Trigger game over screen and reset logic

func LoadScene(scene_path: String):
	var new_scene = load(scene_path)
	get_tree().change_scene_to_packed(new_scene)

func GetCurrentState() -> GameState:
	return current_state

func SetState(new_state: GameState):
	current_state = new_state
	print("Game state changed to: ", str(current_state))
	# You could emit signals here to notify other systems
