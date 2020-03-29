extends Control

onready var health_bar = $HealthBar

func _on_health_updated(vida):
	if vida <= 0:
		health_bar.value = 3
	else:
		health_bar.value = vida
	
