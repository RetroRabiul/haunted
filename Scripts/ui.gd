extends Control

@onready var controls_text = $controls
@onready var search_text = $search
@onready var key_text = $key

func _ready() -> void:
	%Key.hide()
	controls_text.show()
	GlobalSignal.torch_collected.connect(_hide_controls_label)
	GlobalSignal.text.connect(_show_text)
	GlobalSignal.key.connect(_got_key)

func _got_key(text):
	key_text.text = text
	if GlobalVars.player_have_key == true:
		%Key.show()

func _show_text(text):
	if GlobalVars.player_have_fuse == true:
		%Key.hide()
	search_text.text = text
	search_text.show()


func _hide_controls_label():
	controls_text.hide()
	search_text.text = "I'm thirsty, I need a glass of water."
#
#func _search_lext_label():
	#search_text.show()
	#
