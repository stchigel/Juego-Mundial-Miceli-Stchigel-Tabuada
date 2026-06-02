extends RigidBody2D

signal pasarNivelSenal
signal destruidoSenal

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		emit_signal("pasarNivelSenal")
		
func destruir():
	emit_signal("destruidoSenal")
