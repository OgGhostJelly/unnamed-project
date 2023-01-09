extends TileMap


@export var size: Vector2i = Vector2i(200,200)

const atlas_coords: Array = [
	Vector2i(0,0),
	Vector2i(1,0)
]


func _ready() -> void:
	var noise_texture: FastNoiseLite = FastNoiseLite.new()
	noise_texture.noise_type = FastNoiseLite.TYPE_PERLIN
	noise_texture.seed = randi()
	
	for x in range(size.x):
		for y in range(size.y):
			print(noise_texture.get_noise_2d(x, y)," ",floor(noise_texture.get_noise_2d(x, y) - 0.0001) + 1)
			set_cell(0, Vector2i(x,y) - size / 2, 0, atlas_coords[floor(noise_texture.get_noise_2d(x, y) - 0.0001) + 1])
