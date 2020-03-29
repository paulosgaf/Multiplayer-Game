extends Node2D

var direcaoX = 1 # 1 Direita; -1 Esquerda
var direcaoY = 0 # 1 Baixo; -1 Cima
var velocidade = 500 #Velocidade do Tiro
var tempo_vida = 3 # Tempo de vida do tiro
var tempo = 0 # Contador

func _ready():
	set_process(true)
	pass

func _process(delta):
	
	#-------------ALTERANDO POSIÇÃO DA SPRITE-------------
	
	if direcaoX == 1 and direcaoY == 0:
		$Sprite.flip_h = false
	elif direcaoX == -1 and direcaoY == 0:
		$Sprite.flip_h = true
	elif direcaoX == 0 and direcaoY == 1:
		$Sprite.rotation_degrees = 90
	elif direcaoX == 0 and direcaoY == -1:
		$Sprite.rotation_degrees = -90
	elif direcaoX == 1 and direcaoY == -1:
		$Sprite.flip_h = false
		$Sprite.rotation_degrees = -45
	elif direcaoX == 1 and direcaoY == 1:
		$Sprite.flip_h = false
		$Sprite.rotation_degrees = 45
	elif direcaoX == -1 and direcaoY == -1:
		$Sprite.flip_h = true
		$Sprite.rotation_degrees = 45
	elif direcaoX == -1 and direcaoY == 1:
		$Sprite.flip_h = true
		$Sprite.rotation_degrees = -45
	
	#-------------INICIANDO BALA E TEMPO DE VIDA-------------
		
	set_position(Vector2(get_position().x + velocidade*direcaoX*delta, get_position().y + velocidade*direcaoY*delta))
	
	tempo += delta
	if tempo > tempo_vida:
		queue_free()
		
#-------------FUNCAO DE COLISAO-------------
func _on_Detector_body_entered(body):
	if body is KinematicBody2D:
		body.dano()
		queue_free()
	elif body is TileMap:
		queue_free()
