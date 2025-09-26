extends Node

@onready var _dialog = %DialogueBox

func _ready():
	_dialog.display_line("Hello. This is a test of the dialogue system.", "Testing machine 9000")
