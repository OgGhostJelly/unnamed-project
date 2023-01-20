extends Node


signal held_item_changed
signal selected_item_changed


var drop_position: Callable

var held_item: Pickup = null:
	set(v): held_item = v; held_item_changed.emit()
var selected_item: Interactable = null:
	set(v): selected_item = v; selected_item_changed.emit()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("cancel"):
		pickup(null)
		get_viewport().set_input_as_handled()
	
	elif event.is_action_pressed("interact") and can_interact():
		selected_item._interacted()
		get_viewport().set_input_as_handled()


func pickup(_item: Node) -> void:
	if is_instance_valid(held_item): get_tree().current_scene.add_child(held_item); held_item._dropped(_item)
	if is_instance_valid(_item): _item.get_parent().remove_child(_item); _item._pickedup(held_item)
	held_item = _item


func can_interact() -> bool:
	return is_instance_valid(selected_item) and not (is_instance_valid(held_item) and selected_item is Breakable)
