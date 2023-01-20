extends Interactable
class_name Pickup


func _interacted() -> void:
	Inventory.pickup(self)


func _pickedup(_item: Node) -> void:
	pass


func _dropped(_item: Node) -> void:
	if is_instance_valid(_item):
		global_position = _item.global_position
	else:
		global_position = Inventory.drop_position.call()
