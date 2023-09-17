extends Control

@onready var window:Window = get_window()

@onready var bg:Panel = $BG
@onready var code_field:TextEdit = $CodeField

func _ready():
	size = window.size

func _process(delta:float):
	size = window.size
