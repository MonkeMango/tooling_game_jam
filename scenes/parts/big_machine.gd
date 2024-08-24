extends CSGBox3D


var parts : Dictionary = {
	"Booty" : false
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Player:
		for key in parts.keys():
			var part = body.give_part()
			if !parts.has(part):
				pass
			else:
				parts[key] = true
				print("Current part added: %s" % key)
				if body.current_part.part_name == key:
					body.remove_part(body.current_part)
			
