extends CharacterBody2D


@export var speed: float = 400.0
@export var overencumbered: float = 0.5

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@onready var interactable_area: Interactor = $InteractorArea


func _ready() -> void:
	Player.node = self


func _physics_process(_delta: float) -> void:
	movement()
	interactable_area.update_interactable()


func movement() -> void:
	# get input direction
	var input_vector: Vector2 = Input.get_vector(
		"move_left",
		"move_right",
		"move_up",
		"move_down"
	)
	
	velocity = input_vector * speed
	velocity *= overencumbered if is_instance_valid(Player.held_item) else 1.0
	
	move_and_slide()
	
	# if moving then apply walk animation else apply idle animation
	if velocity:
		animation_player.play("walk")
	else:
		animation_player.play("idle")
	
	sprite.flip_h = true if input_vector.x > 0 else false if input_vector.x < 0.0 else sprite.flip_h
