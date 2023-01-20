extends Node


signal hunger_changed
signal thirst_changed
signal worship_changed


var damage: float = 1.0

var hunger: float = 1.0:
	set(v): hunger = v; hunger_changed.emit()
var hunger_decrease: float = 0.01

var thirst: float = 1.0:
	set(v): thirst = v; thirst_changed.emit()
var thirst_decrease: float = 0.01

var worship: float = 0.5:
	set(v): worship = v; worship_changed.emit()
var luck: float = 0.5


func _ready() -> void:
	Game.day_changed.connect(func(): luck = worship; worship *= 0.5)


func _process(delta: float) -> void:
	hunger -= float(max(hunger_decrease * delta, 0.0))
	thirst -= float(max(thirst_decrease * delta, 0.0))
