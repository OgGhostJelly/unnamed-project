extends TileMap


@export var siz: int = 100


func _ready() -> void:
	var noise_texture: NoiseTexture2D = await create_noise_texture(siz, siz)
	var masked_texture: ImageTexture = create_masked_texture(noise_texture)
	var contrasted_texture: ImageTexture = create_contrasted_texture(masked_texture)
	
	generate_map_from_texture(contrasted_texture)


func create_noise_texture(width: int, height: int) -> NoiseTexture2D:
	var noise_texture: NoiseTexture2D = NoiseTexture2D.new()
	noise_texture.noise = FastNoiseLite.new()
	noise_texture.noise.noise_type = FastNoiseLite.TYPE_VALUE_CUBIC
	noise_texture.noise.seed = randi()
	noise_texture.noise.frequency = 0.05
	noise_texture.width = width
	noise_texture.height = height
	await get_tree().process_frame
	return noise_texture


func create_masked_texture(texture: Texture2D, size: float = 0.4, mask_color: Color = Color.BLACK) -> ImageTexture:
	var image: Image = texture.get_image()
	for x in image.get_width(): for y in image.get_height():
		var pos: Vector2 = (Vector2(x, y) / Vector2(image.get_size())) - Vector2(0.5, 0.5)
		if(sqrt(pos.x * pos.x + pos.y * pos.y) < size):
			image.set_pixel(x, y, image.get_pixel(x, y))
		else:
			image.set_pixel(x, y, mask_color)
	return ImageTexture.create_from_image(image)


func create_contrasted_texture(texure: Texture2D) -> ImageTexture:
	var image: Image = texure.get_image()
	for x in image.get_width(): for y in image.get_height():
		var image_color: Color = image.get_pixel(x, y)
		var color: Color = Color(
			round(image_color.r),
			round(image_color.g),
			round(image_color.b),
			round(image_color.a)
		)
		image.set_pixel(x, y, color)
	return ImageTexture.create_from_image(image)


func generate_map_from_texture(texture: Texture2D) -> void:
	var image: Image = texture.get_image()
	for x in image.get_width(): for y in image.get_height():
		set_cell(0, Vector2i(x,y), 0, Vector2i(0,0) if image.get_pixel(x, y) == Color.WHITE else Vector2i(1,0))
