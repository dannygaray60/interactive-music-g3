extends Control

func _on_HighPlay_pressed() -> void:
	$AudioStreamPlayerInteractive.play("high", float($VBx/HBxFade/LineEdit.text))

func _on_LowPlay_pressed() -> void:
	$AudioStreamPlayerInteractive.play("low", float($VBx/HBxFade/LineEdit.text))

func _on_StopAll_pressed() -> void:
	$AudioStreamPlayerInteractive.stop_all(float($VBx/HBxFade/LineEdit.text))

func _on_LinkButton_pressed() -> void:
	pass # OS.shell_open("")
