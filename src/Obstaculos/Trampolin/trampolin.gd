extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Roto.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func destruir():
	$Bien.hide()
	$Roto.show()
	$StaticBody2D.queue_free()
	$Area2D.queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get("_alturaSaltoTrampolin"):
		print("salto")
		body.velocity.y = body._alturaSaltoTrampolin
