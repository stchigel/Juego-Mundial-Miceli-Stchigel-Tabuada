extends Node2D

func destruir():
	$Bien.hide()
	$Roto.show()
	$StaticBody2D.queue_free()
	$Area2D.queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get("alturaSaltoTrampolin"):
		body.velocity.y = body.alturaSaltoTrampolin
