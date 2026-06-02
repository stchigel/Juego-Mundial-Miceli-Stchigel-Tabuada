extends Control

func _on_button_pressed() -> void:
	# volvemos el nivel global a 1 cada vez que empezamos una partida nueva
	GlobalGameManager.nivel_actual = 1 
	get_tree().change_scene_to_file("res://src/Pantallas/Game/game.tscn")

func _on_button_2_pressed() -> void:
	get_tree().quit()
