extends Node2D

var sfx_bus = AudioServer.get_bus_index('Sfx')
var music_bus = AudioServer.get_bus_index('Music')

func _ready():
	$Sfx.value = linkst.saving_stats['Sfx_value']
	$Music.value = linkst.saving_stats['Music_value']
	$v_sync.pressed = linkst.saving_stats["v_sync"]
	$Sounds/Menu_music.play()
	if linkst.saving_stats['g'] == 0:
		$Local.icon = ResourceLoader.load("res://Sprites/For_HScroll/DEU.png")
		$Local.text = 'Deutsch'
		TranslationServer.set_locale('de')
		
		return
	elif linkst.saving_stats['g'] == 1:
		$Local.icon = ResourceLoader.load("res://Sprites/For_HScroll/RUS.png")
		$Local.text = 'Русский'
		TranslationServer.set_locale('ru')
		
		return
	elif linkst.saving_stats['g'] == 2:
		$Local.icon = ResourceLoader.load("res://Sprites/For_HScroll/ENG.png")
		$Local.text = 'English'
		TranslationServer.set_locale('en')
		
		return
	
	



func _input(event):
	if event.is_action_pressed("Escape"):
		get_tree().change_scene("res://Menu_Scenes/Main_menu.tscn")
		$Button_sfx.play()


func _on_v_sync_pressed():
	$Button_sfx.play()
	if $v_sync.pressed:
		OS.vsync_enabled = true
		linkst.saving_stats["v_sync"] = true
		
	else: 
		OS.vsync_enabled = false
		linkst.saving_stats["v_sync"] = false


func _on_Main_menu_pressed():
	$Button_sfx.play()
	yield(get_tree().create_timer(0.1), 'timeout')
	get_tree().change_scene("res://Menu_Scenes/Main_menu.tscn")


func _on_Sfx_value_changed(value):
	AudioServer.set_bus_volume_db(sfx_bus, value)
	if value <= -23.9:
		AudioServer.set_bus_mute(sfx_bus, true)
	else:
		AudioServer.set_bus_mute(sfx_bus, false)
		linkst.saving_stats['Sfx_value'] = value


func _on_Music_value_changed(value):
	AudioServer.set_bus_volume_db(music_bus, value)
	if value <= -27.5:
		AudioServer.set_bus_mute(music_bus, true)
	else:
		AudioServer.set_bus_mute(music_bus, false)
		linkst.saving_stats['Music_value'] = value





func _on_Local_pressed():
	
	if linkst.saving_stats['local_var'] == 0:
		$Local.icon = ResourceLoader.load("res://Sprites/For_HScroll/DEU.png")
		$Local.text = 'Deutsch'
		TranslationServer.set_locale('de')
		linkst.saving_stats['g'] = 0
		linkst.saving_stats['local_var'] += 1
		print('d')
		return
	elif linkst.saving_stats['local_var'] == 1:
		$Local.icon = ResourceLoader.load("res://Sprites/For_HScroll/RUS.png")
		$Local.text = 'Русский'
		TranslationServer.set_locale('ru')
		linkst.saving_stats['g'] = 1
		linkst.saving_stats['local_var'] +=1
		print('r')
		return
	elif linkst.saving_stats['local_var'] == 2:
		$Local.icon = ResourceLoader.load("res://Sprites/For_HScroll/ENG.png")
		$Local.text = 'English'
		TranslationServer.set_locale('en')
		linkst.saving_stats['g'] = 2
		print('e')
		linkst.saving_stats['local_var']=0
		return
