extends CharacterBody2D

signal matarJugador

@onready var animacion = $AnimatedSprite2D 
var posicion_anterior: Vector2

func _ready() -> void:
	posicion_anterior = global_position

func _physics_process(_delta: float) -> void:
	if global_position.distance_to(posicion_anterior) > 0.1:
		animacion.play("correr")
	else:
		animacion.play("idle")
	posicion_anterior = global_position

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		emit_signal("matarJugador")
	if body.is_in_group("copa"):
		body.destruir()
	if body.get_parent().is_in_group("obstaculo"):
		body.get_parent().destruir()
