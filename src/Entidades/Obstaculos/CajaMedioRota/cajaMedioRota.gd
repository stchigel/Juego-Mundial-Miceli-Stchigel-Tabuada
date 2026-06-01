extends Node2D

func _ready() -> void:
	$Roto.hide()

func destruir():
	$Maso.hide()
	$Roto.show()
	if has_node("StaticBody2D"):
		$StaticBody2D.queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("ENTROOO")
	if body.is_in_group("player"):
		$Timer.start()


func _on_timer_timeout() -> void:
	destruir()
