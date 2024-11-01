extends KinematicBody2D


func _ready():
	linkst.enemy = self


func _process(_delta):
	var koord = Vector2()
	koord.y += linkst.speed1
	move_and_slide(koord)	



