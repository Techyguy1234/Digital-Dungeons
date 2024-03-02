extends TileMap

@onready var map = get_node(".")
@onready var grid = []
@onready var grid_output = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	

	
	_initialize_array()
	
	
	
	
	_set_item_in_array(5,5,3)
	
	_set_tileset_to_array()
	get_node("WaveFunctionCollapse").generate_area_from_reference(0,3)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


#Grid functions
func _initialize_array():
	const grid_width = 25
	const grid_height = 25
	for a in grid_height:
		grid.append([])
		for b in grid_width:
			grid[a].append(-1)

func _set_item_in_array(setx,sety,setto):
	grid[setx][sety] = setto

func _get_from_grid(atx,aty):
	grid_output = grid[atx][aty]

	
	
	
func _set_cell_to_value(Posx,Posy,Tilex,Tiley):
	map.set_cell(0,Vector2i(Posx,Posy),0,Vector2i(Tilex,Tiley),0)
	
func _set_tileset_to_array():
	for c in grid.size():
		for d in grid.size():
			_get_from_grid(c,d)
			_set_cell_to_value(c,d,0,grid_output)
