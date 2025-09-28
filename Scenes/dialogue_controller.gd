extends Node

@onready var _dialog = %DialogueBox
func _ready():
	_dialog.display_line("[shake rate=20.0 level=5 connected=1][pulse freq=1.0 color=#FF0000 ease=-2.0]ERROR:[/pulse] Memory processor damaged.[/shake][br][shake rate=20.0 level=5 connected=1][pulse freq=1.0 color=#FF0000 ease=-2.0]ERROR:[/pulse] Critical systems damaged.[/shake][br][shake rate=20.0 level=5 connected=1][pulse freq=1.0 color=#FF0000 ease=-2.0]ERROR:[/pulse] Heavy damage from: [pulse freq=1.0 color=#FF0000 ease=-2.0](FALLING)[/pulse] has been sustained in the [pulse freq=1.0 color=#FF0000 ease=-2.0](HEAD)[/pulse] module. [br][brw] RECCOMMENDATION: Search surroundings for assistance, or tools for repair. Gather information, officer.[/shake]", "SYSTEM:")


func _on_static_body_3d_interacted(body: Variant) -> void:
	_dialog.display_line("Hello. This is a test of the dialogue system.", "Testing machine 9000")
	await _dialog.dialogue_continue
	_dialog.display_line("This is the second test, it should occur after you press space.", "Testing machine 9000")


func _on_postbox_2_interacted(body: Variant) -> void:
	_dialog.display_line("Inside the mailbox is assorted junk mail, primarily containing advertisemens.", "Mail Box")
	await _dialog.dialogue_continue
	_dialog.display_line("The more recent mail seems to all be opened, with the letters being reminders on how to ration food, and reassurances that more supplies will be arriving soon.", "Mail Box") # Replace with function body.
