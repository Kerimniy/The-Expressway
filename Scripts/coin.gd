extends KinematicBody2D


func _process(delta):
	var koord = Vector2()
	koord.y += 700
	move_and_slide(koord)
