extends Control
@onready var _speaker : Label = $VBoxContainer/Speaker
@onready var _dialogue : RichTextLabel = $VBoxContainer/Dialogue
@onready var _continue : Button = $Continue
signal dialogue_continue
func display_line(line: String, speaker: String):
	_speaker.visible = (speaker != "")
	_speaker.text = speaker
	_dialogue.text = line
	open()
	_continue.grab_focus()

func open():
	if %CharacterBody3D:
		%CharacterBody3D.player_input = false
		%CharacterBody3D.player_interaction = false
	visible = true
func close(): 
	if %CharacterBody3D:
		%CharacterBody3D.player_input = true
		%CharacterBody3D.player_interaction = true
	visible = false

func _on_continue_pressed() -> void:
	close()
	dialogue_continue.emit()
