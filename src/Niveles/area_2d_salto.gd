extends Area2D

@export var camara_zona: PhantomCamera2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		# cambio la prioridad, entonces se ajusta a la camara
		camara_zona.priority = 20 

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		camara_zona.priority = 0
