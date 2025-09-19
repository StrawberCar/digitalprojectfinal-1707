extends Node

var normal = load("res://Assets/Images/SOTSCCursor.png")
var click = load("res://Assets/Images/SOTSCCursorClick.png")

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			Input.set_custom_mouse_cursor(click)
	else:
		Input.set_custom_mouse_cursor(normal)
