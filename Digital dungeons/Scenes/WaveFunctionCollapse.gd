extends Node
const size = 8
const types_of_tiles = 4
const types_of_refs = 1
const directions_per_tile = 4
@onready var references = []
var generated_area
@onready var collapsable_tiles
var superpositions




func _ready():
	setup_refs_list()
	setup_refs()
	generate_area_from_reference(0,5)
func _process(_delta):
	pass

func generate_area_from_reference(ref,size_of_area):
	generated_area = []
	for a in size_of_area:
		generated_area.append([])
		for b in size_of_area:
			generated_area[a].append(-1)
	
	setup_superpositions(size_of_area,types_of_tiles)
	
	get_collapseable_tiles_in_grid(size_of_area,ref)
	





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


func get_collapseable_tiles_in_grid(gridsize,ref):
	#for y in gridsize:
	#for x in gridsize:
	get_tile_states(1,1,ref,gridsize)


func setup_superpositions(gridsize,tiletypes):
	superpositions = []
	for a in gridsize:
		superpositions.append([])
		for b in gridsize:
			superpositions[a].append([])
			for c in tiletypes:
				superpositions[a][b].append(c)
	collapsable_tiles = []
	for a in tiletypes:
		collapsable_tiles.append([])
		
#references[current reference][tile type][direction]


func get_tile_states(xinput,yinput,ref,gridsize):
	var possible_states = []
	if not xinput == -1 or not xinput == gridsize or not yinput == -1 or not yinput == gridsize:
		
		
		
		
		#start with top
		if not yinput == 0:
			possible_states.append_array(references[ref][generated_area[xinput][yinput-1]][2])
			print(possible_states)
			if not xinput == gridsize-1:
				for a in possible_states.size():
					if not references[ref][generated_area[xinput+1][yinput]][3].has(possible_states[a]):
						possible_states.remove_at(possible_states.find(possible_states[a]))
			print(possible_states)
			if not yinput == gridsize-1:
				for a in possible_states.size():
					if not references[ref][generated_area[xinput][yinput+1]][0].has(possible_states[a]):
						possible_states.remove_at(possible_states.find(possible_states[a]))
			print(possible_states)
			if not xinput == 0:
				for a in possible_states.size():
					if not references[ref][generated_area[xinput-1][yinput]][3].has(possible_states[a]):
						possible_states.remove_at(possible_states.find(possible_states[a]))
			print(possible_states)
		
		
		#start with right
		elif not xinput == gridsize:
			pass
		
		
		
		
		
		
		
		
		
		#start with bottom
		elif not yinput == gridsize:
			pass
		
		
		
		
		
		
		
		
		
		#start with left
		elif not xinput == 1:
			pass
		
		
		
		
		
		
		
		
		
		
		
		
		
		#for a in references[ref][generated_area[xinput][yinput+1]][2]:
			#pass
		
		#steps if not y == 1
		#step 1: get tile above possible positions
		#step 2: for every possible position, get possible tiles below
		#step 3: set that to possible states
		#step 4: get tile to right possible positions
		#step 5: for every possible position, get possible tiles to left
		#step 7: whichever positions in possible states that it doesnt have are removed
		#step 8: repeat 4-7 for down and left
		
		
		#references[ref][generated_area[xinput][yinput]][0]
	
	
	
	
	
	
	
	
	
	return possible_states





