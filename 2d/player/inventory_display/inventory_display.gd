extends Node2D

var sprite: Sprite2D = Sprite2D.new()

func _ready() -> void:
	Player.item_changed.connect(update_display)

func update_display() -> void:
	if is_instance_valid(sprite):
		sprite.queue_free()
	
	if is_instance_valid(Player.item):
		sprite = Player.item.get_node("Sprite2D").duplicate()
		add_child(sprite)
