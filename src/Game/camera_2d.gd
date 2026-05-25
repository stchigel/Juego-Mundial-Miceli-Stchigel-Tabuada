extends Camera2D
@export var player: Node2D
var offset_x: float = 100
var smooth_speed: float = 5.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#global_position.x = lerp(global_position.x, player.global_position.x, 5 * delta)
	var target_x = player.global_position.x + offset_x
	global_position.x = lerp(global_position.x, target_x, smooth_speed * delta)
