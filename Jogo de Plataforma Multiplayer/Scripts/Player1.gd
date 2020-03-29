extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 30
const SPEED = 200
const JUMP_HEIGHT = -600
var tempoDash = 1
var tempo = tempoDash
var motion = Vector2()
var vida = 3

#----------MOVIMENTACAO DO PERSONAGEM----------
func _physics_process(delta):
	
	tempo += delta
	motion.y += GRAVITY
	
	#-----RUN-----
	if Input.is_key_pressed(KEY_D):
		motion.x = SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = false
	elif Input.is_key_pressed(KEY_A):
		motion.x = -SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = true
	else:
		motion.x = 0
		$Sprite.play("Idle")
		
	#-----JUMP-----
	if is_on_floor():
		if Input.is_key_pressed(KEY_SPACE):
			motion.y = JUMP_HEIGHT
	else:
		$Sprite.play("Jump")
		
	#-----ATACK-----	
	if Input.is_key_pressed(KEY_V):
		$Sprite.play("Atack")
		if $Sprite.flip_h:
			motion.x = SPEED/2
		else:
			motion.x = -SPEED/2
			
	#-----DASH-----	
	if Input.is_key_pressed(KEY_SHIFT) and tempo >= tempoDash:
		$Sprite.play("Run")
		if $Sprite.flip_h:
			motion.x = -5000
		else:
			motion.x = 5000
		tempo = 0
		
	motion = move_and_slide(motion, UP)

#--------------------FUNCOES DE DANO--------------------
	
func dano():
	vida -= 1
	if(vida <= 0):
		die()

func die():
	queue_free()
