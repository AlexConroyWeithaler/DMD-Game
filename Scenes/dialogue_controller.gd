extends Node

@onready var _dialog = %DialogueBox
func _ready():
	pass


func _on_static_body_3d_interacted(body: Variant) -> void:
	_dialog.display_line("Hello. This is a test of the dialogue system.", "Testing machine 9000")
	await _dialog.dialogue_continue
	_dialog.display_line("This is the second test, it should occur after you press space.", "Testing machine 9000")


func _on_postbox_2_interacted(body: Variant) -> void:
	_dialog.display_line("Inside the mailbox is assorted junk mail, primarily containing advertisemens.", "Mail Box")
	await _dialog.dialogue_continue
	_dialog.display_line("The more recent mail seems to all be opened, with the letters being reminders on how to ration food, and reassurances that more supplies will be arriving soon.", "Mail Box") # Replace with function body.
