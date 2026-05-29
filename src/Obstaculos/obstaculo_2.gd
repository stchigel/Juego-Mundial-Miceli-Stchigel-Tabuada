extends StaticBody2D

func destruir():
	queue_free()
	#Aca iria cualquier codigo extra

func _on_area_2d_body_entered(body):
	if body.name=="Jugador":
		body.velocity.y = -300
