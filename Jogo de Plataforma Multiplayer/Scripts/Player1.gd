extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -550
var motion = Vector2()
var vida = 3

#----------MOVIMENTACAO DO PERSONAGEM----------
# warning-ignore:unused_argument
func _physics_process(delta):
	
	motion.y += GRAVITY
	
	if Input.is_key_pressed(KEY_D):
		motion.x = SPEED
		#$Sprite.play("Run")
		#$Sprite.flip_h = false
	elif Input.is_key_pressed(KEY_A):
		motion.x = -SPEED
		#$Sprite.play("Run")
		#$Sprite.flip_h = true
	else:
		motion.x = 0
		#$Sprite.play("Idle")
		
	if is_on_floor():
		if Input.is_key_pressed(KEY_SPACE):
			motion.y = JUMP_HEIGHT
	#else:
		#$Sprite.play("Jump")
		
	motion = move_and_slide(motion, UP)

#--------------------FUNCOES DE DANO--------------------
	
func dano():
	vida -= 1
	if(vida <= 0):
		die()

func die():
	queue_free()
