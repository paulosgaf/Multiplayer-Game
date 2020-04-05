extends Node2D

#---------------VARIAVEIS DO TIRO-------------------------
var direcaoX = 1 # 1 Direita; -1 Esquerda
var direcaoY = 0 # 1 Baixo; -1 Cima
var velocidade = 700 #Velocidade do Tiro
var tempo_vida = 5 # Tempo de vida do tiro
var tempo = 0 # Contador

#---------------VARIAVEIS DE LIMITE DO MAPA#---------------
var MAX_X = 560
var MIN_X = -560
const H_X = 512

var MAX_Y = 440
var MIN_Y = -440
#----------------------------------------------------------

func _ready():
	set_process(true)
	pass

func _process(delta):
	
	#-------------ALTERANDO POSIÇÃO DA SPRITE-------------
	
	
	if direcaoX == 1 or direcaoY == 1:
		$Sprite.flip_h = false
		$Sprite.rotate(0.1)
	elif direcaoX == -1 or direcaoY == -1:
		$Sprite.flip_h = true
		$Sprite.rotate(-0.1)

	
	#-------------INICIANDO BALA E TEMPO DE VIDA-------------
		
	set_position(Vector2(get_position().x + velocidade*direcaoX*delta, get_position().y + velocidade*direcaoY*delta))
	
	tempo += delta
	if tempo > tempo_vida:
		queue_free()
		
	#---------------------TELEPORTE DO MAPA#---------------------

	if get_global_position().x < MIN_X:
		set_global_position(Vector2(MAX_X,get_global_position().y - H_X))
	elif get_global_position().x > MAX_X:
		set_global_position(Vector2(MIN_X,get_global_position().y + H_X))
	elif get_global_position().y > MAX_Y:
		set_global_position(Vector2(get_global_position().x,MIN_Y))
	elif get_global_position().y < MIN_Y:
		set_global_position(Vector2(get_global_position().x,MAX_Y))
		
		
#-------------FUNCAO DE COLISAO-------------
func _on_Detector_body_entered(body):
	if body is KinematicBody2D:
		body.dano()
		queue_free()
	elif (body is TileMap or body is Node2D):
		queue_free()
