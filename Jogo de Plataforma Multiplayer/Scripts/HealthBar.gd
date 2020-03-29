extends Control

onready var health_bar = $HealthBar

func _on_health_updated(vida):
	health_bar.value = vida
