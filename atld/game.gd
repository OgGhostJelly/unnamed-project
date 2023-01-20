extends Node


signal day_changed


var day: int = 1:
	set(v): day = v; day_changed.emit()
var dayt: float = 0.0
var day_length: float = 5.0


func _process(delta: float) -> void:
	dayt += delta / day_length
	
	if dayt >= 1.0:
		dayt = 0.0
		day += 1
