extends Sprite2D

var sprite: Sprite2D = Sprite2D.new()

func _ready() -> void:
	Player.held_item_changed.connect(update_display)

func update_display() -> void:
	visible = is_instance_valid(Player.held_item)
	
	if is_instance_valid(Player.held_item):
		texture = Player.held_item.display
