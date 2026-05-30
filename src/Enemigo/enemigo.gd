extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -400.0
const VERTICAL_SPEED = 80.0
const TRACKING_DEADZONE = 10.0

signal matarJugador

var _player: Node2D

func _ready() -> void:
	_actualizar_player()

func _actualizar_player() -> void:
	var jugadores = get_tree().get_nodes_in_group("player")
	_player = jugadores[0] if not jugadores.is_empty() else null


func _physics_process(delta: float) -> void:
	velocity.x = SPEED
	
	if not is_instance_valid(_player):
		_actualizar_player()
	
	if is_instance_valid(_player):
		#var delta_y = _player.position.y - position.y
		#if abs(delta_y) < TRACKING_DEADZONE:
			#velocity.y = 0
		#elif delta_y < 0:
			#velocity.y = -VERTICAL_SPEED
		#else:
			#velocity.y = VERTICAL_SPEED
		pass
	else:
		velocity.y = 0
	
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("matar jugador")
		emit_signal("matarJugador")
	if body.get_parent().is_in_group("obstaculo"):
		print("obstaculo destruido")
		body.get_parent().destruir()
