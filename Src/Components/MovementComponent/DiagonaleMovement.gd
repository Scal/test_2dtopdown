class_name DiagonaleMovement extends MovementComponentRes

func can_move_to(start_pos: Vector2i, tile_map_layer: TileMapLayer) -> Array[Vector2i]:
	var valid_cells: Array[Vector2i] = []
	var used_rect := tile_map_layer.get_used_rect()
	var start_sum := start_pos.x + start_pos.y
	var start_diff := start_pos.x - start_pos.y
	var seen := {}
	
	for x in range(used_rect.position.x, used_rect.end.x):
		var y := start_sum - x
		var cell_pos := Vector2i(x, y)
		if used_rect.has_point(cell_pos) and not seen.has(cell_pos):
			valid_cells.append(cell_pos)
			seen[cell_pos] = true
	
	for x in range(used_rect.position.x, used_rect.end.x):
		var y := x - start_diff
		var cell_pos := Vector2i(x, y)
		if used_rect.has_point(cell_pos) and not seen.has(cell_pos):
			valid_cells.append(cell_pos)
			seen[cell_pos] = true
	
	return valid_cells
