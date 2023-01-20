extends Area2D
class_name Interactor

var interactable: Interactable = null


func update_interactable() -> void:
	var _interactable: Interactable = get_nearest_interactable()
	
	if not hash(interactable) == hash(_interactable):
		if is_instance_valid(interactable): interactable._deselected()
		if is_instance_valid(_interactable): _interactable._selected()
		
		interactable = _interactable
		Inventory.selected_item = _interactable


func get_nearest_interactable() -> Interactable:
	var closest_area: Area2D = null
	var closest_area_length: float = INF
	for area in get_overlapping_areas() as Array[Area2D]:
		# if area is not a interactable then continue
		if not area.is_in_group("interactables"): continue
		if area.disabled: continue
		
		var area_length: float = area.global_position.distance_to(global_position)
		
		# if closest area is further away then
		if closest_area_length > area_length:
			# set closest area to area and update precalculated length
			closest_area = area
			closest_area_length = area_length
	
	return closest_area
