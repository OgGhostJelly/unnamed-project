extends Interactable2D
@onready var parent: Node2D = get_parent()
func _interacted() -> void:
	parent._interacted()
