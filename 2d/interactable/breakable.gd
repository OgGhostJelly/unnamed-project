extends Interactable
class_name Breakable


@export var max_health: float = 3.0
@export var health: float = 3.0
@export var dropped_item: PackedScene
@export var drop_rate: Vector2i = Vector2i.ONE
@export var drop_spread: float = 20.0



func _interacted() -> void:
	health -= Player.damage
	
	if health <= 0.0:
		drop_items()
		get_parent().queue_free()


func drop_items() -> void:
	for i in randi_range(drop_rate.x, drop_rate.y): drop_item()


func drop_item() -> void:
	var obj: Node = dropped_item.instantiate()
	obj.global_position = global_position + Vector2(randf_range(-drop_spread, drop_spread), randf_range(-drop_spread, drop_spread))
	get_tree().current_scene.add_child(obj)
