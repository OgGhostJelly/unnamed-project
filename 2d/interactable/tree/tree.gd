extends StaticBody2D


@export var max_health: float = 5.0
var health: float = max_health: set = _on_health_changed
@export var regeneration: float = 5.0
@export var drop: PackedScene
@export var drop_amount: int = 3
@export var drop_spread: float = 50.0

@onready var vulnerability_timer: Timer = $VulnerabilityTimer


func _process(delta: float) -> void:
	if vulnerability_timer.is_stopped():
		health = min(health + (max_health / regeneration) * delta, max_health)


func _interacted() -> void:
	health -= 1.0
	vulnerability_timer.start()
	if health <= 0:
		for i in drop_amount:
			var obj: Node2D = drop.instantiate()
			obj.global_position = global_position + Vector2(randf_range(-drop_spread, drop_spread), randf_range(-drop_spread, drop_spread))
			add_sibling(obj)
		
		queue_free()


func _on_health_changed(value: float) -> void:
	health = value
	$Interactor.display_value = health
	$Interactor.max_display_value = max_health
