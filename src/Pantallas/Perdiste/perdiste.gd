extends Control

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://src/Pantallas/Menu/menu.tscn")

func _on_reanudar_pressed() -> void:
	get_tree().change_scene_to_file("res://src/Pantallas/Game/game.tscn")
