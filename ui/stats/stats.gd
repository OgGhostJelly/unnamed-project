extends Control


@onready var hunger: ProgressBar = $LeftPanel/Value/Hunger
@onready var thirst: ProgressBar = $LeftPanel/Value/Thirst
@onready var worship: ProgressBar = $TopPanel/Worship


func _ready() -> void:
	hunger.value = Stats.hunger
	thirst.value = Stats.thirst
	worship.value = Stats.worship
	
	Stats.hunger_changed.connect(func(): hunger.value = Stats.hunger)
	Stats.thirst_changed.connect(func(): thirst.value = Stats.thirst)
	Stats.worship_changed.connect(func(): worship.value = Stats.worship)
