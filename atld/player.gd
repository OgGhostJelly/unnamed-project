extends Node

signal held_item_changed
signal selected_item_changed

var held_item: Pickup = null: set = _held_item_changed
var selected_item: Interactable = null: set = _selected_item_changed
var node: Node = null

var damage: float = 1.0

var hunger: float = 1.0
var hunger_decrease: float = 0.01

var thirst: float = 1.0
var thirst_decrease: float = 0.01

var worship: float = 1.0


func _process(delta: float) -> void:
	hunger -= float(max(hunger_decrease * delta, 0.0))
	thirst -= float(max(thirst_decrease * delta, 0.0))


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("cancel"):
		pickup(null)
		get_viewport().set_input_as_handled()
	
	elif event.is_action_pressed("interact") and can_interact():
		selected_item._interacted()
		get_viewport().set_input_as_handled()


func _held_item_changed(value: Pickup) -> void:
	held_item = value
	held_item_changed.emit()


func _selected_item_changed(value: Interactable) -> void:
	selected_item = value
	selected_item_changed.emit()


func pickup(_item: Node) -> void:
	if is_instance_valid(held_item): get_tree().current_scene.add_child(held_item); held_item._dropped(_item)
	if is_instance_valid(_item): _item.get_parent().remove_child(_item); _item._pickedup(held_item)
	held_item = _item


func can_interact() -> bool:
	return is_instance_valid(selected_item) and not (is_instance_valid(held_item) and selected_item is Breakable)
