extends Node2D


@onready var progress_bar: ProgressBar = $ProgressBar
@onready var sprite: Sprite2D = $Sprite2D


func _process(_delta: float) -> void:
	sprite.scale.x = sin(Time.get_ticks_msec() * 0.005)
	sprite.scale.y = sin(Time.get_ticks_msec() * 0.005)
	
	sprite.visible = is_instance_valid(Player.selected_item) and Player.can_interact()
	progress_bar.visible = is_instance_valid(Player.selected_item) and Player.selected_item is Breakable and Player.can_interact()
	
	if is_instance_valid(Player.selected_item):
		global_position = Player.selected_item.global_position
		
		if Player.selected_item is Breakable:
			progress_bar.max_value = Player.selected_item.max_health
			progress_bar.value = Player.selected_item.health
