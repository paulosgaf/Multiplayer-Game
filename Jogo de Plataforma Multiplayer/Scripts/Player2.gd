extends KinematicBody2D

var UP = Vector2(0, -1)
var GRAVITY = 30
var JUMP_HEIGHT = -600
var SPEED = 200
var tempoDash = 1.5
var tempo = tempoDash
var motion = Vector2()
var vida = 3
var jump_cont = 0
var extra_jump = 1
var _on_wall = false
var was_pressed = true

#----------MOVIMENTACAO DO PERSONAGEM----------
func _physics_process(delta):
	
	var direita = Input.is_action_pressed("ui_right")
	var esquerda = Input.is_action_pressed("ui_left")
	var dash = Input.is_key_pressed(KEY_KP_1)
	var jump = Input.is_key_pressed(KEY_KP_2) && !was_pressed
	var tiro = Input.is_key_pressed(KEY_KP_3) 
	
	tempo += delta
	
	#----VERIFICA SE TECLA ESTA PRESSIONADA----
	if Input.is_key_pressed(KEY_KP_2):
		was_pressed = true
	elif !Input.is_key_pressed(KEY_KP_2):
		was_pressed = false
	
	#----GRAVIDADE----
	if !_on_wall:
		motion.y += GRAVITY
	
	#-----RUN-----
	if direita and !_on_wall:
		motion.x = SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = false
		$Shape.set_position(Vector2(18,0))
		$HealthBar.set_position(Vector2(-5,-50))
		
	elif esquerda and !_on_wall:
		motion.x = -SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = true
		$Shape.set_position(Vector2(0,0))
		$HealthBar.set_position(Vector2(-15,-50))
	else:
		motion.x = 0
		$Sprite.play("Idle")
	
	#----------JUMPs----------
	if jump and jump_cont < extra_jump:
		motion.y = JUMP_HEIGHT
		jump_cont += 1
		_on_wall = false

	if is_on_floor():
		jump_cont = 0
		
	elif _on_wall:
		motion.y = 30
		jump_cont = -1
		$Sprite.play("Wall")
		if $Sprite.flip_h:
			$HealthBar.set_position(Vector2(-35,-50))
			if !esquerda:
				_on_wall = false
				$HealthBar.set_position(Vector2(-15,-50))
		else: 
			$HealthBar.set_position(Vector2(-5,-50))
			if !direita:
				_on_wall = false
				$HealthBar.set_position(Vector2(-25,-50))
			
		
	else:
		$Sprite.play("Jump")
	
	#----------ATACK----------
	if tiro and !_on_wall:
		$Sprite.play("Atack")
	elif tiro and _on_wall:
		$Sprite.play("AtackWall")
			
	#----------DASH----------
	if dash and tempo >= tempoDash and !_on_wall:
		SPEED = 600
		tempo = 0
		$Timer.start()
		
	if SPEED == 600:
		$Sprite.play("Dash")
		if $Sprite.flip_h:
			motion.x = -SPEED
		else:
			motion.x = SPEED

	#------------------------
	
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
	set_global_position(Vector2(320,130))
	var placar_p1 = get_parent().get_node("Contadores/Placar_p1")
	placar_p1.text = str(int(placar_p1.text)+1)
	

func _on_Paredes_p2_body_entered(body):
	if body is KinematicBody2D:
		_on_wall = true

func _on_Paredes_p2_body_exited(body):
	if body is KinematicBody2D:
		_on_wall = false
