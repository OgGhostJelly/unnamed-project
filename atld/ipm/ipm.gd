extends Node2D


signal interactable_changed


@onready var progress_bar: ProgressBar = $ProgressBar
@onready var sprite: Sprite2D = $Sprite2D
var interactable: Interactable: set = _interactable_changed


func _process(_delta: float) -> void:
	sprite.scale.x = sin(Time.get_ticks_msec() * 0.005)
	sprite.scale.y = sin(Time.get_ticks_msec() * 0.005)
	
	update_display_value()


func _interactable_changed(value: Interactable) -> void:
	interactable = value
	interactable_changed.emit()
	
	if is_instance_valid(interactable):
		visible = true
		global_position = interactable.global_position
	else:
		visible = false


func update_display_value() -> void:
	if not is_instance_valid(interactable): return
	
	if interactable.display_value:
		progress_bar.visible = true
		progress_bar.value = interactable.display_value
	else:
		progress_bar.visible = false
	
	if interactable.max_display_value:
		progress_bar.max_value = interactable.max_display_value
