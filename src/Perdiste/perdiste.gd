extends Control

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://src/Menu/menu.tscn")

func _on_reanudar_pressed() -> void:
	# Solo cargamos el gestor principal de vuelta
	get_tree().change_scene_to_file("res://src/Game/game.tscn")
