extends Node2D

onready var tiro0 = preload("res://Cenas/Tiro0.tscn")

const FREQUENCIA = 0.5 #Frequencia do Tiro
var tempo = FREQUENCIA #Contador
var direcaoX = 1 # 1 Direita; -1 Esquerda
var direcaoY = 1 # 1 Direita; -1 Esquerda

func _ready():
	set_process(true)
	pass 
	
# warning-ignore:unused_argument
func _process(delta):
	var direita = Input.is_key_pressed(KEY_D)
	var esquerda = Input.is_key_pressed(KEY_A)
	var cima = Input.is_key_pressed(KEY_W)
	var baixo = Input.is_key_pressed(KEY_S)
	var tiro = Input.is_key_pressed(KEY_V)
	
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
	var tiroZero

	if tiro and direita and baixo and tempo >= FREQUENCIA:
		set_position(Vector2(45,45))
		
		tiroZero = tiro0.instance()
		tiroZero.direcaoX = 1
		tiroZero.direcaoY = 1
		tiroZero.set_global_position(get_global_position())
		get_node("../../").add_child(tiroZero)
		tempo = 0
	
	elif tiro and direita and cima and tempo >= FREQUENCIA:
		set_position(Vector2(45,-45))
		
		tiroZero = tiro0.instance()
		tiroZero.direcaoX = 1
		tiroZero.direcaoY = -1
		tiroZero.set_global_position(get_global_position())
		get_node("../../").add_child(tiroZero)
		tempo = 0
	
	elif tiro and esquerda and baixo and tempo >= FREQUENCIA:
		set_position(Vector2(-45,45))
		
		tiroZero = tiro0.instance()
		tiroZero.direcaoX = -1
		tiroZero.direcaoY = 1
		tiroZero.set_global_position(get_global_position())
		get_node("../../").add_child(tiroZero)
		tempo = 0
	
	elif tiro and esquerda and cima and tempo >= FREQUENCIA:
		set_position(Vector2(-45,-45))
		
		tiroZero = tiro0.instance()
		tiroZero.direcaoX = -1
		tiroZero.direcaoY = -1
		tiroZero.set_global_position(get_global_position())
		get_node("../../").add_child(tiroZero)
		tempo = 0
		
	elif tiro and direcaoX == 1 and direcaoY == 0 and tempo >= FREQUENCIA:
		tiroZero = tiro0.instance()
		tiroZero.direcaoX = 1
		tiroZero.direcaoY = 0
		tiroZero.set_global_position(get_global_position())
		get_node("../../").add_child(tiroZero)
		tempo = 0
	
	elif tiro and direcaoX == -1 and direcaoY == 0 and tempo >= FREQUENCIA:
		tiroZero = tiro0.instance()
		tiroZero.direcaoX = -1
		tiroZero.direcaoY = 0
		tiroZero.set_global_position(get_global_position())
		get_node("../../").add_child(tiroZero)
		tempo = 0
	
	elif tiro and  direcaoX == 0 and direcaoY == 1 and tempo >= FREQUENCIA:
		tiroZero = tiro0.instance()
		tiroZero.direcaoX = 0
		tiroZero.direcaoY = 1
		tiroZero.set_global_position(get_global_position())
		get_node("../../").add_child(tiroZero)
		tempo = 0
	
	elif tiro and direcaoX == 0 and direcaoY == -1 and tempo >= FREQUENCIA:
		tiroZero = tiro0.instance()
		tiroZero.direcaoX = 0
		tiroZero.direcaoY = -1
		tiroZero.set_global_position(get_global_position())
		get_node("../../").add_child(tiroZero)
		tempo = 0
