extends Node2D

@export var niveles: Array[PackedScene]

var _nivelActualNumero: int =1
var _nivelActualNodo: Node 

# llamado una vez cuando se instancia por 1era vez la escena
func _ready() -> void:
	_crearNivel(_nivelActualNumero)


func perder():
	print("Perdiste")
	if get_tree():
		get_tree().change_scene_to_file("res://src/Menu/menu.tscn")


func _crearNivel(numeroNivel :int):
	_nivelActualNodo=niveles[numeroNivel-1].instantiate()
	add_child(_nivelActualNodo)
