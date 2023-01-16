extends Node2D


@onready var progress_bar: ProgressBar = $ProgressBar
@onready var sprite: Sprite2D = $Sprite2D


func _process(_delta: float) -> void:
	sprite.scale.x = sin(Time.get_ticks_msec() * 0.005)
	sprite.scale.y = sin(Time.get_ticks_msec() * 0.005)


func update_display(pos: Variant = null, value: float = 0.0) -> void:
	sprite.visible = not hash(pos) == hash(null)
	progress_bar.visible = not is_zero_approx(value)
	progress_bar.value = value
	
	if not hash(pos) == hash(null):
		global_position = pos
