extends Control
var sfx_bus = AudioServer.get_bus_index('Sfx')
var music_bus = AudioServer.get_bus_index('Music')

func _ready():

	var value = linkst.saving_stats['Music_value']
	AudioServer.set_bus_volume_db(music_bus, value)
	if value <= -27.5:
		AudioServer.set_bus_mute(music_bus, true)
	else:
		AudioServer.set_bus_mute(music_bus, false)
	var value1 = linkst.saving_stats['Sfx_value']
	AudioServer.set_bus_volume_db(sfx_bus, value1)
	if value1 <= -23.9:
		AudioServer.set_bus_mute(sfx_bus, true)
	else:
		AudioServer.set_bus_mute(sfx_bus, false)
		
	print(linkst.saving_stats)
	$Sounds/Menu_music.play()
	if linkst.saving_stats['g'] == 0:
		TranslationServer.set_locale('de')
	elif linkst.saving_stats['g'] == 1:
		TranslationServer.set_locale('ru')
	elif linkst.saving_stats['g'] == 2:
		TranslationServer.set_locale('en')
	
func _on_Quit_pressed():
	$Sounds/Button_sfx.play()
	yield(get_tree().create_timer(0.1), 'timeout')
	get_tree().quit()


func _input(event):
	
	if event.is_action_pressed("Escape"):
		get_tree().quit()


func _on_Play_pressed():
	$Sounds/Button_sfx.play()
	yield(get_tree().create_timer(0.1), 'timeout')
	return get_tree().change_scene("res://Scenes/Game.tscn")
	

func _on_About_Game_pressed():
	$Sounds/Button_sfx.play()
	yield(get_tree().create_timer(0.1), 'timeout')
	return get_tree().change_scene("res://Menu_Scenes/About_Game.tscn")


func _on_Settings_pressed():
	$Sounds/Button_sfx.play()
	yield(get_tree().create_timer(0.1), 'timeout')
	return get_tree().change_scene("res://Menu_Scenes/Settings.tscn")
