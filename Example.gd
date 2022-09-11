extends Control

func _on_HighPlay_pressed() -> void:
	$AudioStreamPlayerInteractive.play("high", float($VBx/HBxFade/LineEdit.text))

func _on_LowPlay_pressed() -> void:
	$AudioStreamPlayerInteractive.play("low", float($VBx/HBxFade/LineEdit.text))

func _on_StopAll_pressed() -> void:
	$AudioStreamPlayerInteractive.stop_all(float($VBx/HBxFade/LineEdit.text))

func _on_LinkButton_pressed() -> void:
	# warning-ignore:return_value_discarded
	OS.shell_open("https://github.com/dannygaray60/interactive-music-g3#how-to-use")
