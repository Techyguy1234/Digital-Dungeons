extends Node
const size = 8
const types_of_tiles = 4
const types_of_refs = 1
const directions_per_tile = 4
@onready var references = []

func _ready():
	setup_refs_list()
	setup_refs()
	generate_area_from_reference(0,5)
func _process(_delta):
	pass

func generate_area_from_reference(_ref,size_of_area):
	var generated_area = []
	var possible_tiles = []
	var collapsable_tiles = []
	for a in size_of_area:
		generated_area.append([])
		possible_tiles.append([])
		collapsable_tiles.append([])
		for b in size_of_area:
			generated_area[a].append([0])
			possible_tiles[a].append([])
			collapsable_tiles[a].append([])
	
	
	
	#I have no idea what this does
	#var get_tile_in_dir
	#for b in size_of_area:
	#	for a in size_of_area:
	#		for r in 4:
	#			if r == 0 and not b == 0:
	#				get_tile_in_dir = generated_area[a][b-1][0]
	#			elif r == 1 and not a == size_of_area-1:
	#				get_tile_in_dir = generated_area[a+1][b][0]
	#			elif r == 2 and not b == size_of_area-1:
	#				get_tile_in_dir = generated_area[a][b+1][0]
	#			elif r == 3 and not a == 0:
	#				get_tile_in_dir = generated_area[a-1][b][0]
	#			else:
	#				get_tile_in_dir = 0
	#			
	#			if not possible_tiles[a][b].has(get_tile_in_dir) and not str(get_tile_in_dir) == "0":
	#				possible_tiles[a][b].append(get_tile_in_dir)
	#print(possible_tiles)




#references[current reference][tile type][direction]
func setup_refs_list():
	for a in types_of_refs:
		references.append([])
		for b in types_of_tiles:
			references[a].append([])
			for c in directions_per_tile:
				references[a][b].append([])
func setup_refs():
	var tile_in_dir
	var current_tile
	for ref in types_of_refs:
		for ys in size:
			for xs in size:
				for dir in directions_per_tile:
					current_tile = get_node("References").get_cell_atlas_coords(0,Vector2i(xs,ys))
					
					if dir == 0:
						tile_in_dir = get_node("References").get_cell_atlas_coords(0,Vector2i(xs,ys-1)).y
					elif dir == 1:
						tile_in_dir = get_node("References").get_cell_atlas_coords(0,Vector2i(xs+1,ys)).y
					elif dir == 2:
						tile_in_dir = get_node("References").get_cell_atlas_coords(0,Vector2i(xs,ys+1)).y
					elif dir == 3:
						tile_in_dir = get_node("References").get_cell_atlas_coords(0,Vector2i(xs-1,ys)).y
					
					if not tile_in_dir == -1 and not references[ref][current_tile.y][dir].has(tile_in_dir):
						references[ref][current_tile.y][dir].append(tile_in_dir)
	#print(references)


func get_collapseable_tiles_in_grid(_gridsize,_ref):
	pass
func get_tiles_possible_states(gridsize,_ref):
	for x in gridsize:
		for y in gridsize:
			for r in 4:
				pass
