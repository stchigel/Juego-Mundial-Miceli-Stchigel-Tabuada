extends PathFollow2D

@export var velocidad: float = 12000.0

func _process(delta: float) -> void:
	# "progress" avanza la posición en píxeles a lo largo de la línea que dibujaste
	progress += velocidad * delta
