extends TileMap
class_name LFFTileMap


@export var chance: float = 1.0
@export var decay: float = 0.99

var deque: Array = [Vector2i.ZERO,Vector2i.ZERO]

func _ready() -> void:
	while not deque.is_empty():
		for i in deque.size():
			set_cell(0, deque[0], 0, Vector2i(1,1))
			deque.pop_front()
			
			if chance >= randf():
				deque.append_array([
					deque[0] + Vector2i(0,-1),
					deque[0] + Vector2i(0,1),
					deque[0] + Vector2i(-1,0),
					deque[0] + Vector2i(1,0)
				].filter(func(v): return not deque.has(v)))
			
			chance *= decay
	set_cells_terrain_connect(0, get_used_cells(0), 0, 0)
