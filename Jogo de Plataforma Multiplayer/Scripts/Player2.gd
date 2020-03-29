extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 30
const SPEED = 200
const JUMP_HEIGHT = -600
var motion = Vector2()
var vida = 3

#----------MOVIMENTACAO DO PERSONAGEM----------
# warning-ignore:unused_argument
func _physics_process(delta):
	
	motion.y += GRAVITY
	
	#-----RUN-----
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = true
	else:
		motion.x = 0
		$Sprite.play("Idle")	
	
	#-----JUMP-----
	if is_on_floor():
		if Input.is_key_pressed(KEY_CONTROL):
			motion.y = JUMP_HEIGHT
	else:
		$Sprite.play("Jump")
	
	#-----ATACK-----
	if Input.is_key_pressed(KEY_ENTER):
		$Sprite.play("Atack")
		if $Sprite.flip_h:
			motion.x = SPEED/2
		else:
			motion.x = -SPEED/2
		
	
	
		
	motion = move_and_slide(motion, UP)
	
#--------------------FUNCOES DE DANO--------------------
	
func dano():
	vida -= 1
	if(vida <= 0):
		die()

func die():
	queue_free()
	
