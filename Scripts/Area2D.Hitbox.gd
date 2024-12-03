extends Area2D


onready  var player = ".."


func _on_HitBox_area_entered(area):
	if area:
		return get_tree().change_scene("res://Scenes/END_SCENE.tscn")
		

func _on_HitBox_body_entered(body):
	if body.name == "coin":
		linkst.score += 1
		body.position.y = rand_range(-100,-1000)
		body.position.x = rand_range(30,1060)
		$coin_sound.play()

