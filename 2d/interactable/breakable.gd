extends Interactable
class_name Breakable


@export var health: float = 10.0


func _interacted() -> void:
	health -= Player.damage
	
	if health <= 0.0:
		get_parent().queue_free()

func _selected() -> void:
	IPM.update_display(global_position, health)
func _deselected() -> void:
	IPM.update_display()
