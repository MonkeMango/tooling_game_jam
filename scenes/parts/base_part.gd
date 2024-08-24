class_name BasePart

extends Area3D

@export var part_name : String

func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		body.add_base_part(self)
