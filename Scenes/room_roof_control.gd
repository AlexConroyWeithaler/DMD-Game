extends Area3D
@onready var roof = $MeshInstance3D
@onready var CharacterBody = %CharacterBody3D/CollisionShape3D
var one_time_checker = true
func _process(float) -> void:
	if one_time_checker:
		roof.visible = false
		roof.visible = true
		one_time_checker = false
	
func fade_out(mesh, duration:float = 0.5):
	var tween = create_tween()
	var material = mesh.surface_get_material(0)
	tween.tween_property(material, "albedo_color:a", 0.0, duration)
	await tween.finished
	#hide_object()
func fade_in(mesh, duration: float = 0.5):
	var tween = create_tween()
	var material = mesh.surface_get_material(0)
	tween.tween_property(material, "albedo_color:a", 1.0, duration)
	await tween.finished
	#show_object()
func hide_object():
	roof.visible = false
func show_object():
	roof.visible = true
	
func _on_body_entered(CharacterBody):
	fade_out(roof.mesh)
func _on_body_exited(CharacterBody):
	fade_in(roof.mesh)
