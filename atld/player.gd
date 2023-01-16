extends Node

signal held_item_changed

var held_item: Pickup = null: set = _held_item_changed
var selected_item: Interactable = null
var node: Node = null


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("cancel"):
		pickup(null)
		get_viewport().set_input_as_handled()
	
	elif event.is_action_pressed("interact") and is_instance_valid(selected_item):
		selected_item._interacted()
		get_viewport().set_input_as_handled()


func _held_item_changed(value: Pickup) -> void:
	held_item = value
	held_item_changed.emit()

func pickup(_item: Node) -> void:
	if is_instance_valid(held_item): get_tree().current_scene.add_child(held_item); held_item._dropped(_item)
	if is_instance_valid(_item): _item.get_parent().remove_child(_item); _item._pickedup(held_item)
	held_item = _item
