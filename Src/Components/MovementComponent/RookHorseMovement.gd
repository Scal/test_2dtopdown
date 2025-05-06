class_name RookHorseMovement extends MovementComponentRes
	
const RookMovement = preload("res://Src/Components/MovementComponent/RookMovement.gd")
const HorseMovement = preload("res://Src/Components/MovementComponent/HorseMovement.gd")

func can_move_to(start_pos: Vector2i, tile_map_layer: TileMapLayer) -> Array[Vector2i]:
	var RookMovementInstance = RookMovement.new()
	var HorseMovementInstance = HorseMovement.new()
	
	return RookMovementInstance.can_move_to(start_pos, tile_map_layer) + HorseMovementInstance.can_move_to(start_pos, tile_map_layer)
