extends Node2D
var title
var title1

func _ready():
	$E_S_M.play()
	$AnimationPlayer.play("open_scene")
	if linkst.saving_stats['g'] == 0:
		title = "Punkte: "
		title1 = "Höchstpunktzahl: "
	elif linkst.saving_stats['g'] == 1:
		title = "Счёт: "
		title1 = "Максимум: "
	elif linkst.saving_stats['g'] == 2:
		title = "Score: "
		title1 = "Max score: "
	
	
	$Score_scene/Label2.text = title1 + str(linkst.saving_stats['max_score'])
	$Score_scene/Label.text = title + str(linkst.score)
	linkst.score = 0

func _on_Button_pressed():
	$Sounds/Button_sfx.play()
	yield(get_tree().create_timer(0.1), 'timeout')
	return get_tree().change_scene("res://Scenes/Game.tscn")


func _on_Main_menu_pressed():
	$Sounds/Button_sfx.play()
	yield(get_tree().create_timer(0.1), 'timeout')
	get_tree().change_scene("res://Menu_Scenes/Main_menu.tscn")



