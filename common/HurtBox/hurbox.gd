extends Area2D

class_name Hurtbox



@export var health_component: HealthComponent


func _on_hit(area: Area2D) -> void:
	if area is Hitbox:
		health_component.get_hit(area.damage)
		area.queue_free()
		
