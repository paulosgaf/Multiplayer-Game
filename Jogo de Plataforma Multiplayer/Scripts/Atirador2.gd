extends Node2D

onready var tiro2 = preload("res://Cenas/Tiro2.tscn")

const FREQUENCIA = 0.5 #Frequencia do Tiro
var tempo = FREQUENCIA #Contador
var direcaoX = -1 # 1 Direita; -1 Esquerda
var direcaoY = 0 # 1 Direita; -1 Esquerda

var was_pressed = true

func _ready():
	set_process(true)
	pass 
	
func _process(delta):
	var direita = Input.is_action_pressed("ui_right")
	var esquerda = Input.is_action_pressed("ui_left")
	var baixo = Input.is_action_pressed("ui_down")
	var cima = Input.is_action_pressed("ui_up")
	var tiro = Input.is_key_pressed(KEY_KP_3) && !was_pressed
	
	#----VERIFICA SE TECLA ESTA PRESSIONADA----
	if Input.is_key_pressed(KEY_KP_3):
		was_pressed = true
	elif !Input.is_key_pressed(KEY_KP_3):
		was_pressed = false

	tempo += delta
	
	#-----------PEGANDO DIREÇÕES DO TECLADO-----------
	if direita:
		direcaoX = 1
		direcaoY = 0
		set_position(Vector2(45,0))
	elif esquerda:
		direcaoX = -1
		direcaoY = 0
		set_position(Vector2(-45,0))
	elif baixo:
		direcaoX = 0
		direcaoY = 1
		set_position(Vector2(0,45))
	elif cima:
		direcaoX = 0
		direcaoY = -1
		set_position(Vector2(0,-45))
	
	#-----------INSTANCIANDO BALAS E SUAS DIREÇÕES-----------
	var tiroDois

	if tiro and direita and baixo and tempo >= FREQUENCIA:
		set_position(Vector2(45,45))
		
		tiroDois = tiro2.instance()
		tiroDois.direcaoX = 1
		tiroDois.direcaoY = 1
		tiroDois.set_global_position(get_global_position())
		get_node("../../").add_child(tiroDois)
		tempo = 0
	
	elif tiro and direita and cima and tempo >= FREQUENCIA:
		set_position(Vector2(45,-45))
		
		tiroDois = tiro2.instance()
		tiroDois.direcaoX = 1
		tiroDois.direcaoY = -1
		tiroDois.set_global_position(get_global_position())
		get_node("../../").add_child(tiroDois)
		tempo = 0
	
	elif tiro and esquerda and baixo and tempo >= FREQUENCIA:
		set_position(Vector2(-45,45))
		
		tiroDois = tiro2.instance()
		tiroDois.direcaoX = -1
		tiroDois.direcaoY = 1
		tiroDois.set_global_position(get_global_position())
		get_node("../../").add_child(tiroDois)
		tempo = 0
	
	elif tiro and esquerda and cima and tempo >= FREQUENCIA:
		set_position(Vector2(-45,-45))
		
		tiroDois = tiro2.instance()
		tiroDois.direcaoX = -1
		tiroDois.direcaoY = -1
		tiroDois.set_global_position(get_global_position())
		get_node("../../").add_child(tiroDois)
		tempo = 0
		
	elif tiro and direcaoX == 1 and direcaoY == 0 and tempo >= FREQUENCIA:
		tiroDois = tiro2.instance()
		tiroDois.direcaoX = 1
		tiroDois.direcaoY = 0
		tiroDois.set_global_position(get_global_position())
		get_node("../../").add_child(tiroDois)
		tempo = 0
	
	elif tiro and direcaoX == -1 and direcaoY == 0 and tempo >= FREQUENCIA:
		tiroDois = tiro2.instance()
		tiroDois.direcaoX = -1
		tiroDois.direcaoY = 0
		tiroDois.set_global_position(get_global_position())
		get_node("../../").add_child(tiroDois)
		tempo = 0
	
	elif tiro and  direcaoX == 0 and direcaoY == 1 and tempo >= FREQUENCIA:
		tiroDois = tiro2.instance()
		tiroDois.direcaoX = 0
		tiroDois.direcaoY = 1
		tiroDois.set_global_position(get_global_position())
		get_node("../../").add_child(tiroDois)
		tempo = 0
	
	elif tiro and direcaoX == 0 and direcaoY == -1 and tempo >= FREQUENCIA:
		tiroDois = tiro2.instance()
		tiroDois.direcaoX = 0
		tiroDois.direcaoY = -1
		tiroDois.set_global_position(get_global_position())
		get_node("../../").add_child(tiroDois)
		tempo = 0
