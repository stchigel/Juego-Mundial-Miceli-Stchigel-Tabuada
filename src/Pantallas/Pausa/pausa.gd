extends CanvasLayer

@export var botonReanudar: Button
@export var botonMenu: Button
@export var botonReiniciar: Button

signal reiniciarNivel

func _ready() -> void:
	botonReanudar.pressed.connect(_alternarPausa)
	botonMenu.pressed.connect(_volverMenu)
	botonReiniciar.pressed.connect(_reiniciarNivel)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pausa"):
		_alternarPausa()

func _volverMenu():
	_alternarPausa()
	get_tree().change_scene_to_file("res://src/Menu/menu.tscn")

func _alternarPausa():
	get_tree().paused = !get_tree().paused
	var hijos := get_children()
	for hijo in hijos:
		hijo.visible = !hijo.visible

func _reiniciarNivel():
	_alternarPausa()
	emit_signal("reiniciarNivel")
