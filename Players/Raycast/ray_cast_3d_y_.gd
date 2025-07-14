extends RayCast3D

func _process(_delta: float) -> void:
	if is_colliding():
		var hit = get_collider()
