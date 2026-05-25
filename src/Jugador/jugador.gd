extends CharacterBody2D

@export var animacion: AnimatedSprite2D
const _velocidad = 200.0
const _velocidad_salto = -400.0


func _physics_process(delta: float) -> void:
	#gravedad 
	velocity += get_gravity() *delta #get_gravity nos devuelve un vector2(x,y). getgravity le suma la gravedad en y a velocity 

	# Handle jump.
	if Input.is_action_just_pressed("saltar") and is_on_floor():
		velocity.y = _velocidad_salto

	if Input.is_action_pressed("derecha"):
		animacion.flip_h=false
		animacion.play("correr")
		velocity.x = _velocidad
	elif Input.is_action_pressed("izquierda"):
		animacion.flip_h=true
		animacion.play("correr")
		velocity.x = -_velocidad
	else:
		animacion.play("idle")
		velocity.x = 0
	move_and_slide()
