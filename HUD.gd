extends HBoxContainer

onready var _label: = $Label
onready var _color_rect: = $ColorRect
onready var _color_value: = $ColorValue


func update_color(new_color: Color) -> void:
	_color_rect.color = new_color
	_color_value.text = str(new_color)


func update_mouse(new_pos: Vector2) -> void:
	_label.text = "Hidden Color at " + str(new_pos)
