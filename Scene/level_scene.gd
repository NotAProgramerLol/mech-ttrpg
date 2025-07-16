extends Node3D

var geselecteerde_speler : Node3D = null

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		selecteer_speler(event.position)

func selecteer_speler(mouse_pos: Vector2):
	var camera = $Camera3D
	var from = camera.project_ray_origin(mouse_pos)
	var to = from + camera.project_ray_normal(mouse_pos) * 1000

	var space_state = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(from, to)
	var result = space_state.intersect_ray(query)

	if result:
		var geraakt = result.collider
		if geraakt.is_in_group("Spelers"):
			geselecteerde_speler = geraakt
			print("Speler geselecteerd:", geraakt.name)
