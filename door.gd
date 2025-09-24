extends Node3D
var playback : AnimationNodeStateMachinePlayback
var is_open := false

func _ready():
	playback = $AnimationTree.get("parameters/playback")

func toggle(_body):
	is_open = not is_open
	if is_open:
		playback.travel("Open Door")
	else:
		playback.travel("Close Door")


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Open Door":
		$Door/Hitbox/CollisionShape3D.disabled = true
	else:
		$Door/Hitbox/CollisionShape3D.disabled = false
	


func _on_static_body_3d_interacted(body: Variant) -> void:
	toggle(self)# Replace with function body.
