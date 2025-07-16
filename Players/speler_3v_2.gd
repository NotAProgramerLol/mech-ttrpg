extends CharacterBody3D

@export var step_size := 2.0
@export var tween_duration := 0.2

#Raycast
@onready var RayCast3D_Rechts = $Raycast_main/RayCast3D_Rechts
@onready var RayCast3D_links = $Raycast_main/RayCast3D_Links
@onready var RayCast3D_Achter = $Raycast_main/RayCast3D_Achter
@onready var RayCast3D_Voor = $Raycast_main/RayCast3D_Voor
@onready var RayCast3D_Op = $Raycast_main/RayCast3D_Op
@onready var RayCast3D_Neer = $Raycast_main/RayCast3D_Neer




var tween_active := false
func _physics_process(_delta):

	var move_vector = Vector3.ZERO
	
	if Input.is_action_just_pressed("Rechts"):
		if not RayCast3D_Rechts.is_colliding():
			move_vector.x += step_size
			
	
	if Input.is_action_just_pressed("Links"):
		if not RayCast3D_links.is_colliding():
			move_vector.x -= step_size
			
	if Input.is_action_just_pressed("Achter"):
		if not RayCast3D_Achter.is_colliding():
			move_vector.z += step_size
			
	if Input.is_action_just_pressed("Voor"):
		if not RayCast3D_Voor.is_colliding():
			move_vector.z -= step_size
			
	if Input.is_action_just_pressed("Op"):
		if not RayCast3D_Op.is_colliding():
			move_vector.y += step_size
			
	if Input.is_action_just_pressed("Neer"):
		if not RayCast3D_Neer.is_colliding():
			move_vector.y -= step_size




#Tween beweging
	if move_vector != Vector3.ZERO:
		var target_pos = global_position + move_vector
		var tween := get_tree().create_tween()
		tween_active = true
		tween.tween_property(self, "global_position", target_pos, tween_duration)\
			.set_trans(Tween.TRANS_SINE)\
			.set_ease(Tween.EASE_IN_OUT)
		tween.finished.connect(_on_tween_finished)
		


func _on_tween_finished():
	tween_active = false
