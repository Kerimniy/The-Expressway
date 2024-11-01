extends Node2D

func _ready(): 
	
	if linkst.saving_stats['g'] == 0:
		$Label.text = "Punkte"
		$Label2.text = "Höchstpunktzahl"
	elif linkst.saving_stats['g'] == 1:
		$Label.text = "Счёт: 0"
		$Label2.text = "Максимум: 0"
	elif linkst.saving_stats['g'] == 2:
		$Label.text = "Score: 0"
		$Label2.text = "Max score: 0"
