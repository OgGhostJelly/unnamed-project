extends Interactable
class_name Pickup


func _ready() -> void:
	disabled = Inventory.is_storage_maxed
	Inventory.items_changed.connect(func(): disabled = Inventory.is_storage_maxed)


func _interacted() -> void:
	Inventory.add_item(self)
	get_parent().remove_child(self)
