extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func destruir():
	queue_free()
	#Aca iria cualquier codigo extra


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.saltar()
	pass # Replace with function body.
