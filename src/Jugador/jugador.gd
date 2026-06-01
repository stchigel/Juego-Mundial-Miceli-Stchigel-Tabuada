extends CharacterBody2D

@export var animacion: AnimatedSprite2D
const _velocidad = 200.0
const _alturaSalto = -400.0
const alturaSaltoTrampolin = -500.0
const _velocidadDash = 400.0

var haciendo_dash: bool = false
var puede_hacer_dash: bool = true

func saltar():
	velocity.y = _alturaSalto

func _physics_process(delta: float) -> void:
	if haciendo_dash:
		move_and_slide()
		return

	velocity += get_gravity() * delta

	if Input.is_action_just_pressed("saltar") and is_on_floor():
		saltar()

	# Al tocar el dash iniciamos la acción y CORTAMOS la ejecución con return
	if Input.is_action_just_pressed("dash") and puede_hacer_dash:
		_iniciar_dash()
		return 

	if Input.is_action_pressed("derecha"):
		animacion.flip_h = false
		animacion.play("correr")
		velocity.x = _velocidad
	elif Input.is_action_pressed("izquierda"):
		animacion.flip_h = true
		animacion.play("correr")
		velocity.x = -_velocidad
	else:
		animacion.play("idle")
		velocity.x = 0
		
	move_and_slide()

func _iniciar_dash():
	puede_hacer_dash = false
	haciendo_dash = true
	
	var direccion = -1 if animacion.flip_h else 1
	
	velocity.x = direccion * _velocidadDash
	velocity.y = 0 
	
	await get_tree().create_timer(0.2).timeout 
	haciendo_dash = false
	
	await get_tree().create_timer(1.0).timeout 
	puede_hacer_dash = true
