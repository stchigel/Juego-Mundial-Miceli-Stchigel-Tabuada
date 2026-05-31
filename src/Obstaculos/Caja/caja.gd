extends Node2D

func _ready() -> void:
	$Roto.hide()


func _process(delta: float) -> void:
	pass

func destruir():
	$Bien.hide()
	$Roto.show()
	$StaticBody2D.queue_free()
