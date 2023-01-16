extends Area2D
class_name Interactable


var disabled: bool = false


func _init() -> void:
	add_to_group("interactables")


func _selected() -> void:
	IPM.update_display(global_position)
	pass


func _deselected() -> void:
	IPM.update_display()
	pass


func _interacted() -> void:
	pass
