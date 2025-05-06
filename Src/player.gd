extends Node2D

@export var GridPosition : Vector2i
@export var MovementComponent : MovementComponentRes
var CharacterController : BaseComponentRes

@onready var tile_map_layer: TileMapLayer = $"../TileMapLayer"
var tile_map_tile_size : float

var valid_cells: Array[Vector2i] = []

func _ready():
	tile_map_tile_size = tile_map_layer.tile_set.tile_size.x
	InputHandler.connect("on_click", Callable(self, "_on_click"))
	CharacterController = CharacterControllerRes.new()
	self.global_position = Vector2i(GridPosition.x * tile_map_tile_size - tile_map_tile_size/2, GridPosition.y * tile_map_tile_size - tile_map_tile_size/2)
	CharacterController.move_to(self, GridPosition.x+1 , GridPosition.y+1)
	_can_i_move_to(GridPosition)
	
func _on_click(pos):
	var target_pos_on_grid = Vector2i(pos.x/tile_map_tile_size, pos.y/tile_map_tile_size)
	if valid_cells.has(target_pos_on_grid):
		CharacterController.move_to(self, target_pos_on_grid.x+1, target_pos_on_grid.y+1)
		tile_map_layer.set_cell(Vector2i(pos.x/tile_map_tile_size, pos.y/tile_map_tile_size), 2, Vector2i(0,0), 0)
		if CharacterController :
			_can_i_move_to(target_pos_on_grid)

func _can_i_move_to(start_pos):
	_clear_cells()
	valid_cells = MovementComponent.can_move_to(start_pos, tile_map_layer)
	for i in valid_cells:
		tile_map_layer.set_cell(Vector2i(i.x, i.y), 2, Vector2i(0,0), 0)

func _clear_cells():
	for i in valid_cells:
		tile_map_layer.set_cell(Vector2i(i.x, i.y), 1, Vector2i(0,0), 0)
