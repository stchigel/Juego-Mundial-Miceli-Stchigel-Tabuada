extends Node2D

func _ready() -> void:
	$Roto.hide()

func destruir():
	$Bien.hide()
	$Roto.show()
	$StaticBody2D.queue_free()
