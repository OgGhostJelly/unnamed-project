extends Area2D
class_name Interactable


@export var display: Texture
@export var disabled: bool = false


func _init() -> void:
	add_to_group("interactables")


func _selected() -> void:
	pass


func _deselected() -> void:
	pass


func _interacted() -> void:
	pass
