extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const VERTICAL_SPEED = 1.0

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
		if _player.position.y < position.y:
			velocity.y = -VERTICAL_SPEED
		else:
			velocity.y = VERTICAL_SPEED
	else:
		velocity.y = 0

	move_and_slide()

	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().is_in_group("player"):
			get_parent().perder()
		else: if collision.get_collider().is_in_group("obstaculo") and collision.get_collider().has_method("destruir"): 
			collision.get_collider().destruir()
