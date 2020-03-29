extends Node

func _ready():
	pass # Replace with function body.
	
func _process(delta):
	
	#----------TELEPORTE DO MAPA----------
	
	#----------HORIZONTAL----------
	
	if $Player1.get_global_position().x < -20:
		$Player1.set_global_position(Vector2(1040,$Player1.get_global_position().y))
	elif $Player1.get_global_position().x > 1050:
		$Player1.set_global_position(Vector2(-10,$Player1.get_global_position().y))
	 
	if $Player2.get_global_position().x < -20:
		$Player2.set_global_position(Vector2(1040,$Player2.get_global_position().y))
	elif $Player2.get_global_position().x > 1050:
		$Player2.set_global_position(Vector2(-10,$Player2.get_global_position().y))
		
	#----------VERTICAL----------
	
	if $Player1.get_global_position().y > 640:
		$Player1.set_global_position(Vector2($Player1.get_global_position().x,-40))
	elif $Player1.get_global_position().y < -40:
		$Player1.set_global_position(Vector2($Player1.get_global_position().x,640))
		
	if $Player2.get_global_position().y > 640:
		$Player2.set_global_position(Vector2($Player2.get_global_position().x,-40))
	elif $Player2.get_global_position().y < -40:
		$Player2.set_global_position(Vector2($Player2.get_global_position().x,640))

	
