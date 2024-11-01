extends Node2D
func _ready():
	$Sounds/Menu_music.play()

func _on_Main_menu_pressed():
	$Sounds/Button_sfx.play()
	yield(get_tree().create_timer(0.1), 'timeout')
	get_tree().change_scene("res://Menu_Scenes/Main_menu.tscn")
	
	
func _input(event):
	if event.is_action_pressed("Escape"):
		get_tree().change_scene("res://Menu_Scenes/Main_menu.tscn")
