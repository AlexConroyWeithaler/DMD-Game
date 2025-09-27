extends Node

@onready var _dialog = %DialogueBox
func _ready():
	pass


func _on_static_body_3d_interacted(body: Variant) -> void:
	_dialog.display_line("Hello. This is a test of the dialogue system.", "Testing machine 9000")
	await _dialog.dialogue_continue
	_dialog.display_line("This is the second test, it should occur after you press space.", "Testing machine 9000")
