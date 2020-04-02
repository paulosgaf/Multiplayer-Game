extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 30
const JUMP_HEIGHT = -600
var SPEED = 200
var tempoDash = 1.5
var tempo = tempoDash
var motion = Vector2()
var vida = 3
var jump_cont = 0
var extra_jump = 1
var was_pressed = true

#----------MOVIMENTACAO DO PERSONAGEM----------
func _physics_process(delta):
	
	var direita = Input.is_key_pressed(KEY_D)
	var esquerda = Input.is_key_pressed(KEY_A)
	var dash = Input.is_key_pressed(KEY_SHIFT)
	var jump = Input.is_key_pressed(KEY_SPACE) && !was_pressed
	var tiro = Input.is_key_pressed(KEY_V) 
	
	#----VERIFICA SE TECLA ESTA PRESSIONADA----
	if Input.is_key_pressed(KEY_SPACE):
		was_pressed = true
	elif !Input.is_key_pressed(KEY_SPACE):
		was_pressed = false
	
	tempo += delta
	motion.y += GRAVITY
	
	#-----RUN-----
	if direita:
		motion.x = SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = false
		$Shape.set_position(Vector2(-5,0))
		$HealthBar.set_position(Vector2(-25,-50))
	elif esquerda:
		motion.x = -SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = true
		$Shape.set_position(Vector2(0,0))
		$HealthBar.set_position(Vector2(-15,-50))
	else:
		motion.x = 0
		$Sprite.play("Idle")
		
	#-----JUMP-----
	if jump and jump_cont < extra_jump:
		motion.y = JUMP_HEIGHT
		jump_cont += 1

	if is_on_floor():
		jump_cont = 0
	else:
		$Sprite.play("Jump")
		
	#-----ATACK-----	
	if tiro:
		$Sprite.play("Atack")
			
	#-----DASH-----	
	if SPEED == 600:
		$Sprite.play("Dash")
		if $Sprite.flip_h:
			motion.x = -SPEED
		else:
			motion.x = SPEED
			
	if dash and tempo >= tempoDash:
		SPEED = 600
		tempo = 0
		$Timer.start()
		
	#---------
	
	motion = move_and_slide(motion, UP)
	
#--------------------TIMER DASH--------------------
func _on_Timer_timeout():
	SPEED = 200

#--------------------FUNCOES DE VIDA--------------------
func life():
	if vida < 3:
		vida += 1
		$HealthBar._on_health_updated(vida)
	
func dano():
	vida -= 1
	$HealthBar._on_health_updated(vida)
	if(vida <= 0):
		die()

func die():
	vida = 3
	set_global_position(Vector2(-320,-225))
	

	

