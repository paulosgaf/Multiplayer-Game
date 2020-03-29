extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 30
const JUMP_HEIGHT = -600
var SPEED = 200
var tempoDash = 1.5
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
		$Shape.set_position(Vector2(-5,0))
		$HealthBar.set_position(Vector2(-25,-50))
	elif Input.is_key_pressed(KEY_A):
		motion.x = -SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = true
		$Shape.set_position(Vector2(0,0))
		$HealthBar.set_position(Vector2(-15,-50))
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
	if SPEED == 500:
		$Sprite.play("Dash")
		if $Sprite.flip_h:
			motion.x = -SPEED
		else:
			motion.x = SPEED
			
	if Input.is_key_pressed(KEY_SHIFT) and tempo >= tempoDash:
		SPEED = 500
		tempo = 0
		$Timer.start()
		
	#--------------
	
	motion = move_and_slide(motion, UP)
	
#--------------------TIMER DASH--------------------
func _on_Timer_timeout():
	SPEED = 200

#--------------------FUNCOES DE DANO--------------------	
func dano():
	vida -= 1
	$HealthBar._on_health_updated(vida)
	if(vida <= 0):
		die()

func die():
	queue_free()


