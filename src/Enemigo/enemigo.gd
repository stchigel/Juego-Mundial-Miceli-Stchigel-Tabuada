extends CharacterBody2D

signal matarJugador

func _ready() -> void:
	$AnimatedSprite2D.play()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		emit_signal("matarJugador")
	if body.is_in_group("copa"):
		body.destruir()
	if body.get_parent().is_in_group("obstaculo"):
		body.get_parent().destruir()
