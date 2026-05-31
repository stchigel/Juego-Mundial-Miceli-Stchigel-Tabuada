extends CharacterBody2D

signal matarJugador

#var _player: Node2D

func _ready() -> void:
	$AnimatedSprite2D.play()
	#_actualizar_player()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("matar jugador")
		emit_signal("matarJugador")
	if body.is_in_group("copa"):
		print("copa destruida")
		body.destruir()
	if body.get_parent().is_in_group("obstaculo"):
		print("obstaculo destruido")
		body.get_parent().destruir()

#func _actualizar_player() -> void:
	#var jugadores = get_tree().get_nodes_in_group("player")
	#_player = jugadores[0] if not jugadores.is_empty() else null

#PRIMERA VERSION DEL MOVIMIENTO, AHORA ES CON UN PATH...
#func _physics_process(_delta: float) -> void:
	#velocity.x = _velocidad
	#
	#if not is_instance_valid(_player):
		#_actualizar_player()
	#
	#if is_instance_valid(_player):
		##var delta_y = _player.position.y - position.y
		##if abs(delta_y) < _trackingDeadzone:
			##velocity.y = 0
		##elif delta_y < 0:
			##velocity.y = -_alturaSalto
		##else:
			##velocity.y = _alturaSalto
		#pass
	#else:
		#velocity.y = 0
	#
	#move_and_slide()
