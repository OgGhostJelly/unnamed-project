extends Area2D
class_name Interactable


var disabled: bool = false
var display_value: float
var max_display_value: float


func _init() -> void:
	add_to_group("interactables")


func _selected() -> void:
	pass


func _deselected() -> void:
	pass


func _interacted() -> void:
	pass
