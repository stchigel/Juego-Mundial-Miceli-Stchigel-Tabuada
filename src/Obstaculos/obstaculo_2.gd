extends StaticBody2D

func destruir():
	queue_free()
	#Aca iria cualquier codigo extra


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.saltar()
