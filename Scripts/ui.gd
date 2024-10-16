extends Control

@onready var controls_text = $controls
@onready var search_text = $search

func _ready() -> void:
	controls_text.show()
	search_text.hide()
	GlobalSignal.torch_collected.connect(_hide_controls_label)
	


func _hide_controls_label():
	controls_text.hide()
	call_deferred("_search_lext_label")

func _search_lext_label():
	search_text.show()
	
