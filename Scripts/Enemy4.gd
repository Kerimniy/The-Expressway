extends KinematicBody2D


func _process(_delta):
	var koord = Vector2()
	koord.y += linkst.speed4
	move_and_slide(koord)
