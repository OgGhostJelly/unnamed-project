extends Node

signal items_changed


var items: Array[Pickup] = []#: set = _items_changed
var max_storage: int = 3
var is_storage_maxed: bool = false


func _items_changed() -> void:#value: Array[Pickup]) -> void:
	#items = value
	is_storage_maxed = true if items.size() >= max_storage else false
	items_changed.emit()


func add_item(item: Node) -> void:
	items.append(item)
	_items_changed()

func remove_item(item: Node) -> void:
	items.erase(item)
	_items_changed()
