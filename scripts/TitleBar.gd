extends Panel

@onready var window:Window = get_window()
@onready var title_text:Label = $TitleText

var following:bool = false
var drag_start_pos:Vector2 = Vector2.ZERO

func _ready():
	window.titlebar_changed.connect(_update_text)
	_update_text()

func _update_text():
	title_text.text = window.title

func _on_gui_input(event:InputEvent):
	if not event is InputEventMouseButton:
		return
	
	event = event as InputEventMouseButton
	
	if event.get_button_index() == MOUSE_BUTTON_LEFT:
		following = not following
		drag_start_pos = get_local_mouse_position()
		
func _process(_delta:float):
	if following:
		window.position += Vector2i(get_global_mouse_position() - drag_start_pos)
