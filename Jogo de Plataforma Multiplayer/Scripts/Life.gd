extends Area2D

func _ready():
	pass 

func _on_Life_body_entered(body):
	queue_free()
	if body is KinematicBody2D:
		body.life()
