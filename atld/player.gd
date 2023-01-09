extends Node

signal item_changed

var item: Pickup = null: set = _item_changed
var node: Node = null


func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("cancel"):
		pickup(null)

func _item_changed(value: Pickup) -> void:
	item = value
	item_changed.emit()

func pickup(_item: Node) -> void:
	if is_instance_valid(item): get_tree().current_scene.add_child(item); item._dropped(_item)
	if is_instance_valid(_item): _item.get_parent().remove_child(_item); _item._pickedup(item)
	item = _item
