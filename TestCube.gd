extends Spatial

# The hidden cube is on render layer 5. 
# The main camera ignores layer 5. The hidden camera sees only layer 5.
# The hidden viewport update mode is set to Always. Can be changed to Once 
# if the hidden texture is constant.

onready var _hidden_view: = $HiddenViewport
onready var _hud: = $HUD


func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	var hidden_tex = _hidden_view.get_texture().get_data()
	# The mouse_pos is in y-downward axis while texture UV have y-upward.
	# Hence take the y flip.
	hidden_tex.flip_y()
	hidden_tex.lock()
	var hidden_color = hidden_tex.get_pixelv(mouse_pos)
	hidden_tex.unlock()
	
	_hud.update_mouse(mouse_pos)
	_hud.update_color(hidden_color)
