@tool
extends Control

const MINIMIZE_TEX:Texture2D = preload("res://assets/titlebar/minimize.png")
const MAXIMIZE_TEX:Texture2D = preload("res://assets/titlebar/maximize.png")
const RESTORE_TEX:Texture2D = preload("res://assets/titlebar/restore.png")
const CLOSE_TEX:Texture2D = preload("res://assets/titlebar/close.png")

@onready var window:Window = get_window()

@onready var sprite:Sprite2D = $Sprite
@onready var bright_shader:ShaderMaterial = $Sprite.material

var hovered:bool = false
var pressed:bool = false

var brightness:float = 0.0:
	get:
		return bright_shader.get_shader_parameter("amount") 
	
	set(value):
		bright_shader.set_shader_parameter("amount", value)

@export var texture:Texture2D = CLOSE_TEX:
	set(value):
		$Sprite.texture = value
		texture = value
		
func _ready():
	sprite.material = bright_shader.duplicate()
	bright_shader = sprite.material
		
func _process(delta:float):
	if Engine.is_editor_hint():
		return
	
	brightness = lerpf(brightness, 1.5 if hovered and not pressed else 1.0, delta * 60 * 0.25)

func _on_hitbox_mouse_entered():
	hovered = true

func _on_hitbox_mouse_exited():
	hovered = false
	pressed = false
	
func _input(event:InputEvent):
	if not event is InputEventMouseButton:
		return
	
	event = event as InputEventMouseButton
	if event.get_button_index() == MOUSE_BUTTON_LEFT and hovered:
		pressed = not pressed
		if not pressed: _on_button_press()
		
func _on_button_press():
	match str(name):
		"Minimize":
			window.mode = Window.MODE_MINIMIZED
			
		"Maximize":
			if window.mode == Window.MODE_MAXIMIZED:
				window.mode = Window.MODE_WINDOWED
			else:
				window.mode = Window.MODE_MAXIMIZED
		
		"Close":
			get_tree().quit()
