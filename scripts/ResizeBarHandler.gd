extends Control

@onready var window:Window = get_window()
@onready var main:Control = $"../.."

@export var left:bool = false
@export var top:bool = false
@export var vertical:bool = true

var following:bool = false
var mouse_offset:Vector2 = Vector2.ZERO
var window_pos:Vector2 = Vector2.ZERO
var window_size:Vector2 = Vector2.ZERO
var distance_to_edge:float = 0.0

func _ready():
	if vertical:
		if top:
			distance_to_edge = global_position.y - window_size.y
		else:
			distance_to_edge = window.size.y - global_position.y
	else:
		if left:
			distance_to_edge = global_position.x
		else:
			distance_to_edge = global_position.x - window.size.x

func _process(_delta:float):
	if not following:
		return
	if get_window().mode == Window.MODE_FULLSCREEN:
		return
	
	if vertical:
		if top:
			window.position.y = (window.position.y + get_global_mouse_position().y - mouse_offset.y) - distance_to_edge
			window.position.x = window_pos.x
			window.size.y = window_size.y + (window_pos.y - window.position.y)
		else:
			window.size.y = get_global_mouse_position().y + distance_to_edge - mouse_offset.y
	else:
		if left:
			window.position.x = (window.position.x + get_global_mouse_position().x - mouse_offset.x) - distance_to_edge
			window.position.y = window_pos.y
			window.size.x = window_size.x + (window_pos.x - window.position.x)
		else:
			window.size.x = get_global_mouse_position().x - distance_to_edge - mouse_offset.x
	
	main.size = window.size

func _on_gui_input(event:InputEvent):
	if not event is InputEventMouseButton:
		return
	
	event = event as InputEventMouseButton
	if event.get_button_index() == MOUSE_BUTTON_LEFT:
		mouse_offset = get_local_mouse_position()
		window_pos = window.position
		window_size = window.size
		following = not following
