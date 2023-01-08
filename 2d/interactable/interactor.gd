extends Area2D
class_name InteractableArea2D

var interactable: Interactable2D = null


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if is_instance_valid(interactable):
			interactable._interacted()


func update_interactable() -> void:
	var _interactable: Interactable2D = get_nearest_interactable()
	
	if not hash(interactable) == hash(_interactable):
		if is_instance_valid(interactable): interactable._deselected()
		if is_instance_valid(_interactable): _interactable._selected()
		
		interactable = _interactable
		IPM.interactable = _interactable


func get_nearest_interactable() -> Interactable2D:
	var closest_area: Area2D = null
	var closest_area_length: float = INF
	
	for area in get_overlapping_areas() as Array[Area2D]:
		# if area is not a interactable then continue
		if not area is Interactable2D: continue
		
		var area_length: float = area.global_position.distance_to(global_position)
		
		# if closest area is further away then
		if closest_area_length > area_length:
			# set closest area to area and update precalculated length
			closest_area = area
			closest_area_length = area_length
	
	return closest_area