extends Node2D
var title
var title1
var ready = true
var array = ['Enemy1','Enemy2','Enemy3','Enemy4']


func _ready():
	$coin.position.x = rand_range(20, 1080)
	$Sounds/Game_music.play()
	
	randomize()
	if linkst.saving_stats['g'] == 0:
		title = "Punkte: "
		title1 = "Höchstpunktzahl: "
	elif linkst.saving_stats['g'] == 1:
		title = "Счёт: "
		title1 = "Максимум: "
	elif linkst.saving_stats['g'] == 2:
		title = "Score: "
		title1 = "Max score: "
	random_speed()
	get_node(array[0]).position.y = rand_range(-100, -2500)
	get_node(array[1]).position.y = rand_range(-100, -2500)
	get_node(array[2]).position.y = rand_range(-100, -2500)
	get_node(array[3]).position.y = rand_range(-100, -2500)
	if abs($Enemy1.position.y - $Enemy2.position.y) < 100 and  abs($Enemy3.position.y - $Enemy4.position.y) < 70:
		get_node(array[int(rand_range(0,4))]).position.y = rand_range(-100, -1500)
		get_node(array[int(rand_range(0,4))]).position.y = rand_range(-100, -1500)
	linkst.game = self


func _process(_delta):
		print(Engine.get_frames_per_second())
		$Score_scene/Label2.text = title1  + str(linkst.saving_stats['max_score'])
		$Score_scene/Label.text = title + str(linkst.score)
		if linkst.score > linkst.saving_stats['max_score']:
			linkst.saving_stats['max_score'] = linkst.score
			
		random_speed()
		if get_node(array[0]).position.y >= 900:
			if is_instance_valid(self):
				yield(get_tree().create_timer(0.2),'timeout')
			game_process('Enemy1')
			change_color('Enemy1/Sprite')
			
			
		elif get_node(array[1]).position.y >= 900:		
			if is_instance_valid(self):
				yield(get_tree().create_timer(0.2),'timeout')
			game_process('Enemy2')
			change_color('Enemy2/Sprite')
			
		elif get_node(array[2]).position.y >= 900:		
			if is_instance_valid(self):
				yield(get_tree().create_timer(0.2),'timeout')
			game_process('Enemy3')
			change_color('Enemy3/Sprite')
			
		elif get_node(array[3]).position.y >= 900:	
			if is_instance_valid(self):
				yield(get_tree().create_timer(0.2),'timeout')
			game_process('Enemy4')
			change_color('Enemy4/Sprite')
			
		if ready == true:
			ready = false
			
			create_new_obj()
		if $coin.position.y >= 850:
			$coin.position.y = rand_range(-100,-1000)
			$coin.position.x = rand_range(30,1060)

func change_color(obj_sprite):
	
	var random = int(rand_range(0,4))
	if random == 0:
		get_node(obj_sprite).texture =ResourceLoader.load("res://Sprites/en1.png")
	elif random == 1:
		get_node(obj_sprite).texture =ResourceLoader.load("res://Sprites/en2.png")
	elif random == 2:
		get_node(obj_sprite).texture =ResourceLoader.load("res://Sprites/en3.png")
	else:
		get_node(obj_sprite).texture =ResourceLoader.load("res://Sprites/en4.png")


func game_process(obj):
	get_node(obj).position.y = rand_range(-100, -2500)
	if obj == 'Enemy1':
		$Enemy1.position.x = rand_range(30,240)
	elif obj == 'Enemy2':
		$Enemy2.position.x = rand_range(300,520)
	elif obj == 'Enemy3':
		$Enemy3.position.x = rand_range(580,800)
	elif obj == 'Enemy4':
		$Enemy4.position.x = rand_range(860,1070)


func _input(event):
	if event.is_action_pressed("Escape"):
		get_tree().change_scene("res://Menu_Scenes/Main_menu.tscn")


func random_speed():
	randomize()
	linkst.speed1 = rand_range(400,1200)
	linkst.speed2 = rand_range(400,1200)
	linkst.speed3 = rand_range(400,1200)
	linkst.speed4 = rand_range(400,1200)


func create_new_obj():
	var rand = int(rand_range(0,4))
	var list = [linkst.Enemy1_preload,linkst.Enemy1_preload,linkst.Enemy1_preload,linkst.Enemy1_preload]
	yield(get_tree().create_timer(1),'timeout')
	$".".add_child(list[rand].instance())
	get_child(get_child_count()-1).scale *= Vector2(1.2, 1.2)
	get_child(get_child_count()-1).position.y = rand_range(-400, -900)
	
	if rand == 0:
		get_child(get_child_count()-1).position.x = rand_range(30,240)
		change_color(get_child(get_child_count()-1).name +'/Sprite')
		
	elif rand == 1:
		get_child(get_child_count()-1).position.x = rand_range(300,520)
		change_color(get_child(get_child_count()-1).name +'/Sprite')
		
	elif rand == 2:
		get_child(get_child_count()-1).position.x = rand_range(580,800)
		change_color(get_child(get_child_count()-1).name +'/Sprite')
		
	else:
		get_child(get_child_count()-1).position.x = rand_range(860,1070)
		change_color(get_child(get_child_count()-1).name +'/Sprite')
		
	if is_instance_valid(self):
		yield(get_tree().create_timer(6),'timeout')
		get_child(get_child_count()-1).queue_free()
	ready = true




