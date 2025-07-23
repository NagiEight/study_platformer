extends Node

var music_player : AudioStreamPlayer
var sfx_player : AudioStreamPlayer2D

var master_volume := 1.0
var music_volume := 1.0
var sfx_volume := 1.0

func _ready():
	# Adjust paths to match your scene layout
	music_player = get_node("MusicPlayer")
	sfx_player = get_node("SFXPlayer")

func PlayMusic(track_name : String, volume : float = 1.0) -> void:
	const music_path = "res://assets/music/time_for_adventure.mp3";
	var stream = preload(music_path)

	music_player.stream = stream
	music_player.volume_db = linear_to_db(volume * master_volume * music_volume)
	music_player.play()

func StopMusic() -> void:
	if music_player.playing:
		music_player.stop()

func PlaySFX(sfx_name : String, position : Vector2) -> void:
	var stream = load("res://Audio/SFX/%s.ogg" % sfx_name)
	sfx_player.global_position = position
	sfx_player.stream = stream
	sfx_player.volume_db = linear_to_db(master_volume * sfx_volume)
	sfx_player.play()

func SetVolume(master : float, music : float, sfx : float) -> void:
	master_volume = clamp(master, 0, 1)
	music_volume = clamp(music, 0, 1)
	sfx_volume = clamp(sfx, 0, 1)
	# Apply new volume settings to active players
	if music_player.playing:
		music_player.volume_db = linear_to_db(master_volume * music_volume)

func PlayRandomSFX(sfx_list : Array) -> void:
	if sfx_list.size() == 0:
		return
	var random_name = sfx_list[randi() % sfx_list.size()]
	PlaySFX(random_name, Vector2.ZERO)  # or a custom default position
