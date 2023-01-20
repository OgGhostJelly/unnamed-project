extends Interactable
class_name Breakable


@export var defense: float = 3.0
@export var drops: Array[PackedScene]
@export var spread: float = 30.0

var health: float = 1.0



func _interacted() -> void:
	health -= Stats.damage / defense
	
	if health <= 0.0 or is_zero_approx(health):
		drop_items()
		get_parent().queue_free()


func drop_items() -> void:
	for x in drops: drop_item(x)


func drop_item(item: PackedScene) -> void:
	var obj: Node = item.instantiate()
	obj.global_position = global_position + Vector2(randf_range(-spread, spread), randf_range(-spread, spread))
	get_tree().current_scene.add_child(obj)
