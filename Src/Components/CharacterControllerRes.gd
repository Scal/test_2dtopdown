class_name CharacterControllerRes extends BaseComponentRes

func move_to(caller: Node, x : int, y : int):
	caller.global_position = Vector2i(x*32-16, y*32-16)
