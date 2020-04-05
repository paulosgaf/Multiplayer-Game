extends Node2D

onready var tiro1 = preload("res://Cenas/Tiro1.tscn")

const FREQUENCIA = 0.5 #Frequencia do Tiro
var tempo = FREQUENCIA #Contador
var direcaoX = 1 # 1 Direita; -1 Esquerda
var direcaoY = 0 # 1 Direita; -1 Esquerda

var direita
var esquerda
var cima
var baixo
var tiro
var was_pressed = true
var last_pressed = 1

func _ready():
	set_process(true)
	pass 
	
func _process(delta):
	
	#----SETA TECLAS PARA ATIRAR DA PAREDE OU DO CHAO----
	var _on_wall = get_parent().get_parent().get_node("Player1")._on_wall
	
	if(_on_wall):
		direita = Input.is_key_pressed(KEY_A)
		esquerda = Input.is_key_pressed(KEY_D)
	else:
		direita = Input.is_key_pressed(KEY_D)
		esquerda = Input.is_key_pressed(KEY_A)
		
	cima = Input.is_key_pressed(KEY_W)
	baixo = Input.is_key_pressed(KEY_S)
	tiro = Input.is_key_pressed(KEY_V) && !was_pressed
	
	#----VERIFICA SE TECLA ESTA PRESSIONADA----
	if Input.is_key_pressed(KEY_V):
		was_pressed = true
	elif !Input.is_key_pressed(KEY_V):
		was_pressed = false
	
	tempo += delta
	
	#-----------PEGANDO DIREÇÕES DO TECLADO-----------
	if direita:
		direcaoX = 1
		direcaoY = 0
		set_position(Vector2(45,0))
		last_pressed = 1
	elif esquerda:
		direcaoX = -1
		direcaoY = 0
		set_position(Vector2(-45,0))
		last_pressed = -1
	elif baixo:
		direcaoX = 0
		direcaoY = 1
		set_position(Vector2(0,45))
	elif cima:
		direcaoX = 0
		direcaoY = -1
		set_position(Vector2(0,-45))
	else: 
		#----Voltando direção pra direita ou esquerda
		if last_pressed == 1:
			direcaoX = 1
			direcaoY = 0
			set_position(Vector2(45,0))
		elif last_pressed == -1:
			direcaoX = -1
			direcaoY = 0
			set_position(Vector2(-45,0))
		
		
	
	#-----------INSTANCIANDO BALAS E SUAS DIREÇÕES-----------
	var tiroUm

	if tiro and direita and baixo and tempo >= FREQUENCIA:
		set_position(Vector2(45,45))
		
		tiroUm = tiro1.instance()
		tiroUm.direcaoX = 1
		tiroUm.direcaoY = 1
		tiroUm.set_global_position(get_global_position())
		get_node("../../").add_child(tiroUm)
		tempo = 0
	
	elif tiro and direita and cima and tempo >= FREQUENCIA:
		set_position(Vector2(45,-45))
		
		tiroUm = tiro1.instance()
		tiroUm.direcaoX = 1
		tiroUm.direcaoY = -1
		tiroUm.set_global_position(get_global_position())
		get_node("../../").add_child(tiroUm)
		tempo = 0
	
	elif tiro and esquerda and baixo and tempo >= FREQUENCIA:
		set_position(Vector2(-45,45))
		
		tiroUm = tiro1.instance()
		tiroUm.direcaoX = -1
		tiroUm.direcaoY = 1
		tiroUm.set_global_position(get_global_position())
		get_node("../../").add_child(tiroUm)
		tempo = 0
	
	elif tiro and esquerda and cima and tempo >= FREQUENCIA:
		set_position(Vector2(-45,-45))
		
		tiroUm = tiro1.instance()
		tiroUm.direcaoX = -1
		tiroUm.direcaoY = -1
		tiroUm.set_global_position(get_global_position())
		get_node("../../").add_child(tiroUm)
		tempo = 0
		
	elif tiro and direcaoX == 1 and direcaoY == 0 and tempo >= FREQUENCIA:
		tiroUm = tiro1.instance()
		tiroUm.direcaoX = 1
		tiroUm.direcaoY = 0
		tiroUm.set_global_position(get_global_position())
		get_node("../../").add_child(tiroUm)
		tempo = 0
	
	elif tiro and direcaoX == -1 and direcaoY == 0 and tempo >= FREQUENCIA:
		tiroUm = tiro1.instance()
		tiroUm.direcaoX = -1
		tiroUm.direcaoY = 0
		tiroUm.set_global_position(get_global_position())
		get_node("../../").add_child(tiroUm)
		tempo = 0
	
	elif tiro and  direcaoX == 0 and direcaoY == 1 and tempo >= FREQUENCIA:
		tiroUm = tiro1.instance()
		tiroUm.direcaoX = 0
		tiroUm.direcaoY = 1
		tiroUm.set_global_position(get_global_position())
		get_node("../../").add_child(tiroUm)
		tempo = 0
	
	elif tiro and direcaoX == 0 and direcaoY == -1 and tempo >= FREQUENCIA:
		tiroUm = tiro1.instance()
		tiroUm.direcaoX = 0
		tiroUm.direcaoY = -1
		tiroUm.set_global_position(get_global_position())
		get_node("../../").add_child(tiroUm)
		tempo = 0
