extends Node2D

@export var niveles: Array[PackedScene]

var _nivelActualNumero: int =1
var _nivelActualNodo: Node 

# llamado una vez cuando se instancia por 1era vez la escena
func _ready() -> void:
	_crearNivel(_nivelActualNumero)

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
		enemigo.matarJugador.connect(_reiniciarNivel)
		
	var copa = get_tree().get_first_node_in_group("copa")
	if copa:
		copa.pasarNivelSenal.connect(_pasarNivel)

func _reiniciarNivel():
	_nivelActualNodo.queue_free()
	_crearNivel.call_deferred(_nivelActualNumero)
	
func _pasarNivel():
	_nivelActualNumero +=1
	_reiniciarNivel()
