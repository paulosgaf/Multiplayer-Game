extends Node

const MAX_X = 560
const MIN_X = -560
const H_MAX_X = 340
const H_MIN_X = 270

const MAX_Y = 440
const MIN_Y = -440

func _ready():
	pass # Replace with function body.
	
func _process(delta):
	#----------TELEPORTE DO MAPA----------
	
	#----------HORIZONTAL----------
	
	if $Player1.get_global_position().x < MIN_X:
		$Player1.set_global_position(Vector2(MAX_X,$Player1.get_global_position().x + H_MAX_X))
	elif $Player1.get_global_position().x > MAX_X:
		$Player1.set_global_position(Vector2(MIN_X,$Player1.get_global_position().x - H_MIN_X))
	 
	if $Player2.get_global_position().x < MIN_X:
		$Player2.set_global_position(Vector2(MAX_X,$Player2.get_global_position().x + H_MAX_X))
	elif $Player2.get_global_position().x > MAX_X:
		$Player2.set_global_position(Vector2(MIN_X,$Player2.get_global_position().x - H_MIN_X))
		
#	#----------VERTICAL----------
	
	if $Player1.get_global_position().y > MAX_Y:
		$Player1.set_global_position(Vector2($Player1.get_global_position().x,MIN_Y))
	elif $Player1.get_global_position().y < MIN_Y:
		$Player1.set_global_position(Vector2($Player1.get_global_position().x,MAX_Y))
		
	if $Player2.get_global_position().y > MAX_Y:
		$Player2.set_global_position(Vector2($Player2.get_global_position().x,MIN_Y))
	elif $Player2.get_global_position().y < MIN_Y:
		$Player2.set_global_position(Vector2($Player2.get_global_position().x,MAX_Y))
		

#-----------------------FECHA O JOGO NO ESC-----------------------
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().quit()

	
