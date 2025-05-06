extends Node

signal on_click(position: Vector2)

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == 1:
			emit_signal("on_click", event.position)
