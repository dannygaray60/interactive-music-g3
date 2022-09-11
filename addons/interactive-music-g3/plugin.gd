tool
extends EditorPlugin


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	# Add the new type with a name, a parent type, a script and an icon.
	add_custom_type("AudioStreamPlayerInteractive", "Node", preload("res://addons/interactive-music-g3/audio_stream_player_interactive.gd"), preload("res://addons/interactive-music-g3/icon.png"))


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	# Always remember to remove it from the engine when deactivated.
	remove_custom_type("AudioStreamPlayerInteractive")
