extends Node3D


@export var step_size := 2.0
@export var tween_duration := 0.2
@export var rotation_speed := 45.0
@onready var game_manager = get_parent()  # of get_node("/root/...") als nodig

var tween_active := false




func _physics_process(_delta):

	
	if tween_active:
		return
	
	var rotate_vector := Vector3.ZERO
	
	#Draai
	if Input.is_action_just_pressed("Draai_Links"):
		rotate_vector.y = deg_to_rad(rotation_speed)
	if Input.is_action_just_pressed("Draai_Rechts"):
		rotate_vector.y = deg_to_rad(-rotation_speed)

		#Tween draai
	if rotate_vector != Vector3.ZERO:
		var target_rot = global_rotation + rotate_vector
		var tween := get_tree().create_tween()
		tween_active = true

		tween.tween_property(self, "global_rotation", target_rot, tween_duration)\
			.set_trans(Tween.TRANS_SINE)\
			.set_ease(Tween.EASE_IN_OUT)
		tween.finished.connect(_on_tween_finished)

func _on_tween_finished():
	tween_active = false
