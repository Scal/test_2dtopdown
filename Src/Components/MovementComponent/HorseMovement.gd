class_name HorseMovement extends MovementComponentRes

func can_move_to(start_pos: Vector2i, tile_map_layer: TileMapLayer) -> Array[Vector2i]:
	var valid_cells: Array[Vector2i] = []
	var used_rect := tile_map_layer.get_used_rect()
	var seen := {}
	
	var knight_offsets = [
		Vector2i(2, 1), Vector2i(2, -1),
		Vector2i(-2, 1), Vector2i(-2, -1),
		Vector2i(1, 2), Vector2i(1, -2),
		Vector2i(-1, 2), Vector2i(-1, -2)
	]
	
	for offset in knight_offsets:
		var cell_pos = start_pos + offset
		if used_rect.has_point(cell_pos):
			if not seen.has(cell_pos):
				valid_cells.append(cell_pos)
				seen[cell_pos] = true
	
	return valid_cells
