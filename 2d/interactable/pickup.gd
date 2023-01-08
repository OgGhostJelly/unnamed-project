extends Interactable
class_name Pickup


func _ready() -> void:
	disabled = Inventory.is_storage_maxed
	Inventory.storage_maxed.connect(func(): disabled = true)
	Inventory.storage_nmaxed.connect(func(): disabled = false)


func _interacted() -> void:
	Inventory.add_item(self)
	get_parent().remove_child(self)
