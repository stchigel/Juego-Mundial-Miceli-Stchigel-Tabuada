extends Node2D

@export var niveles: Array[PackedScene]

var _nivelActualNodo: Node 

func _ready() -> void:
	# Ahora lee el nivel desde el Singleton global
	_crearNivel(GlobalGameManager.nivel_actual)

func _crearNivel(numeroNivel :int):
	_nivelActualNodo=niveles[numeroNivel-1].instantiate()
	add_child(_nivelActualNodo)
	
	#esto es para esperar 1 fotograma a que el niel viejo se borre
	await get_tree().process_frame
	#sino al hacer la logica que esta debajo, godot no sabe si agarrar
	#al personaje del nivel anterior o al que se creó recien, entonces
	#esperamos 1 fotograma para que se elimine el anterior y 
	#solo haya q agarrar el recien creado :) 
	
	var enemigo = get_tree().get_first_node_in_group("enemigo")
	if enemigo:
		enemigo.matarJugador.connect(_perderNivel)
		
	var copa = get_tree().get_first_node_in_group("copa")
	if copa:
		copa.pasarNivelSenal.connect(_pasarNivel)
		copa.destruidoSenal.connect(_perderNivel)

func reiniciarNivel():
	_nivelActualNodo.queue_free()
	_crearNivel.call_deferred(GlobalGameManager.nivel_actual)

func _perderNivel():
	get_tree().change_scene_to_file.call_deferred("res://src/Perdiste/perdiste.tscn")

func _pasarNivel():
	# Verificamos si todavía quedan niveles en el array
	if GlobalGameManager.nivel_actual < niveles.size():
		GlobalGameManager.nivel_actual += 1
		reiniciarNivel()
	else:
		# Si ya no hay más niveles, cargamos la pantalla de victoria
		get_tree().change_scene_to_file.call_deferred("res://src/Ganaste/ganaste.tscn")
