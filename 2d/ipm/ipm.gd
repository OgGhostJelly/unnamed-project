extends Node2D


@onready var progress_bar: ProgressBar = $ProgressBar
@onready var sprite: Sprite2D = $Sprite2D


func _process(_delta: float) -> void:
	sprite.scale.x = sin(Time.get_ticks_msec() * 0.005)
	sprite.scale.y = sin(Time.get_ticks_msec() * 0.005)
	
	sprite.visible = is_instance_valid(Inventory.selected_item) and Inventory.can_interact()
	progress_bar.visible = is_instance_valid(Inventory.selected_item) and Inventory.selected_item is Breakable and Inventory.can_interact()
	
	if is_instance_valid(Inventory.selected_item):
		global_position = Inventory.selected_item.global_position
		
		if Inventory.selected_item is Breakable:
			progress_bar.value = Inventory.selected_item.health
