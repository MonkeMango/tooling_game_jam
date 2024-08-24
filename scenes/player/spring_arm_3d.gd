extends SpringArm3D

@export var mouse_sens : float = 0.05

@export var cam_v_max : float = 75
@export var cam_v_min : float = -55
var camrot_h : float = 0.0
var camrot_v : float = 0.0
var h_sens : float = .1
var v_sens : float = .1

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		camrot_h += -event.relative.x * h_sens
		camrot_v -= event.relative.y * v_sens
	
func _physics_process(delta: float) -> void:
	camrot_v = clamp(camrot_v, cam_v_min, cam_v_max)

	rotation_degrees.y = lerp(rotation_degrees.y, camrot_h, delta * 10)
	rotation_degrees.x = lerp(rotation_degrees.x, camrot_v, delta * 10)
