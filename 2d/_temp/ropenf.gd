extends TileMap
class_name ROFTileMap


@export var depth: int = 20
var otiles: Array = [Vector2i.ZERO]
var tiles: Dictionary = {}


class ROFTile extends Node:
	var neighbors: Dictionary = {
		Vector2i(-1,0):null,
		Vector2i(1,0):null,
		Vector2i(0,-1):null,
		Vector2i(0,1):null
	}
	var position: Vector2i
	var roftilemap: ROFTileMap
	
	func _init(_position: Vector2i, _roftilemap: ROFTileMap) -> void:
		position = _position
		
		roftilemap = _roftilemap
		roftilemap.tiles[position] = self
		
		roftilemap.otiles.erase(position)
		roftilemap.otiles.append_array(neighbors.keys().map(func(v): return position + v))
		
		roftilemap.set_cell(0, position, 0, Vector2i(0,0))
		update_neighbors()

	func update_neighbors() -> void:
		for d in neighbors.keys():
			if is_instance_valid(roftilemap.tiles.get(position + d)):
				roftilemap.otiles.erase(position + d)


func _ready() -> void:
	while depth > tiles.size():
		for t in otiles.duplicate():
			if randf() > 0.001: continue
			ROFTile.new(t, self)

