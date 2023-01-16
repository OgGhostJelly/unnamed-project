extends Node2D


@onready var progress_bar: ProgressBar = $ProgressBar
@onready var sprite: Sprite2D = $Sprite2D


func _process(_delta: float) -> void:
	sprite.scale.x = sin(Time.get_ticks_msec() * 0.005)
	sprite.scale.y = sin(Time.get_ticks_msec() * 0.005)
	
	update_display_value()
	update_position()


func update_position() -> void:
	if is_instance_valid(Player.selected_item):
		visible = true
		global_position = Player.selected_item.global_position
	else:
		visible = false


func update_display_value() -> void:
	if not is_instance_valid(Player.selected_item): return
	
	if Player.selected_item.display_value:
		progress_bar.visible = true
		progress_bar.value = Player.selected_item.display_value
	else:
		progress_bar.visible = false
	
	if Player.selected_item.max_display_value:
		progress_bar.max_value = Player.selected_item.max_display_value
