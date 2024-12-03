extends KinematicBody2D


var speed = 1100


func _process(_delta):
	var koord = Vector2()
	if Input.is_action_pressed("Left"):
		koord.x -= speed
	elif Input.is_action_pressed("Right"):
		koord.x += speed
		
	move_and_slide(koord)
	
	position.x = clamp(position.x, 0, 965)





