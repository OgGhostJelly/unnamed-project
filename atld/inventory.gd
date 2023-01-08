extends Node

signal storage_maxed
signal storage_nmaxed


var items: Array = []
var max_storage: int = 3
var is_storage_maxed: bool = false


func add_item(item: Node) -> void:
	items.append(item)
	
	if items.size() >= max_storage:
		storage_maxed.emit()
		is_storage_maxed = true


func remove_item(item: Node) -> void:
	items.erase(item)
	
	if items.size() < max_storage:
		storage_nmaxed.emit()
		is_storage_maxed = false
