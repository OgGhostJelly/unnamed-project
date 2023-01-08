extends CharacterBody2D


@export var speed: float = 400.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var interactable_area: Interactor = $InteractorArea


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
	
	move_and_slide()
	
	# if moving then apply walk animation else apply idle animation
	if velocity:
		animation_player.play("walk")
	else:
		animation_player.play("idle")
	
	# flip character based on direction it is moving in
	transform.x.x = 1.0 if input_vector.x > 0 else -1.0 if input_vector.x < 0.0 else transform.x.x
