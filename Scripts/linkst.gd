extends Node
var saving_stats= {
	'max_score':  0,
	'v_sync': false,
	'Sfx_value':  -11,
	'Music_value': -11,
	'local_var': 0,
	'g': 0
}


var game
var enemy
var scene

#Общие переменные
var score = 0
var speed1 =800
var speed2 =800
var speed3 =800
var speed4 =800

#Предзагрузка
var end_scene_preload = preload("res://Scenes/END_SCENE.tscn")
var Game_preload = preload("res://Scenes/Game.tscn")
var Enemy1_preload = preload("res://Scenes/Enemy1.tscn")
var Enemy2_preload = preload("res://Scenes/Enemy2.tscn")
var Enemy3_preload = preload("res://Scenes/Enemy3.tscn")
var Enemy4_preload = preload("res://Scenes/Enemy4.tscn")

#Таймер
var time = 2
var is_ready = true
var save_path = "user://savings.dat"
#Сохранение
func save_data():
	var save_file = File.new()
	save_file.open_encrypted_with_pass(save_path, File.WRITE, "-")
	save_file.store_var(saving_stats)
	save_file.close()


func load_data():
	var save_file = File.new()
	if not save_file.file_exists(save_path): return
	save_file.open_encrypted_with_pass(save_path, File.READ, "-")
	var new_data = save_file.get_var()
	save_file.close()
	if not new_data: return
	saving_stats = new_data


func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		save_data()
	if what == NOTIFICATION_ENTER_TREE:
		load_data()
