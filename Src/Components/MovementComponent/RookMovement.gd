class_name RookMovement extends MovementComponentRes

func can_move_to(start_pos: Vector2i, tile_map_layer: TileMapLayer) -> Array[Vector2i]:
	var valid_cells: Array[Vector2i] = []
	var used_rect := tile_map_layer.get_used_rect()
	
	for x in range(used_rect.position.x, used_rect.end.x):
		var cell_pos := Vector2i(x, start_pos.y)
		valid_cells.append(cell_pos)
	
	for y in range(used_rect.position.y, used_rect.end.y):
		var cell_pos := Vector2i(start_pos.x, y)
		valid_cells.append(cell_pos)
		
	return valid_cells
