class_name Player

extends CharacterBody3D

@export var spring_arm : SpringArm3D

enum {
	UNHANDLED,
	IDLE,
	MOVE,
	JUMP
}

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	move(delta)

func move(delta : float):
	var input_vector : Vector3 = Vector3(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
	0,
	Input.get_action_strength("move_down") - Input.get_action_strength("move_up")).normalized()
	
	input_vector = input_vector.rotated(Vector3.UP, spring_arm.rotation.y)
	
	velocity.x = input_vector.x * SPEED
	velocity.z = input_vector.z * SPEED
	
	move_and_slide()
